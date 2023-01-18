import { Injectable } from '@nestjs/common';
import * as bcrypt from 'bcrypt';
import * as jwt from 'jsonwebtoken';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { addDays } from 'date-fns';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { HttpException, NotFoundException } from '@nestjs/common/exceptions';
import { HttpStatus } from '@nestjs/common/enums';
import { TOKEN_NOT_FOUND } from 'consts';
import { use } from 'passport';

@Injectable()
export class AuthService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly configService: ConfigService,
    private readonly jwtService: JwtService,
  ) {}

  async login(email: string, password: string) {
    // find user with matching email
    const user = await this.prisma.users.findFirst({ where: { email } });
    if (!user) {
      throw new HttpException(
        'Invalid email or password',
        HttpStatus.FORBIDDEN,
      );
    }

    // compare provided password with hashed password in database
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
      throw new HttpException(
        'Invalid email or password',
        HttpStatus.FORBIDDEN,
      );
    }

    // generate JWT token
    const token = await this.jwtService.signAsync(
      { id: user.id, email: user.email, roleId: user.role_id },
      {
        secret: this.configService.get('JWT_SECRET'),
      },
    );

    function expirationDate(): Date {
      return addDays(new Date(), 7);
    }

    // index token in database
    await this.prisma.tokens.create({
      data: {
        token,
        expiration: expirationDate(),
        users: { connect: { id: user.id } },
      },
    });

    return {
      access_token: token,
    };
  }

  async register(userData: Prisma.usersCreateInput): Promise<void> {
    // hash password
    const hashedPassword = await bcrypt.hash(userData.password, 10);

    const user = await this.prisma.users.findFirst({
      where: { email: userData.email },
    });

    if (user) {
      throw new HttpException(
        'This email already in use',
        HttpStatus.FORBIDDEN,
      );
    }

    // create user
    await this.prisma.users.create({
      data: {
        ...userData,
        age: +userData.age,
        password: hashedPassword,
        role_id: 2,
      },
    });
  }

  async me(token: string) {
    const existedToken = await this.prisma.tokens.findFirst({
      where: { token },
    });

    if (!existedToken) {
      throw new NotFoundException(TOKEN_NOT_FOUND);
    }

    return this.jwtService.verifyAsync(
      token,
      this.configService.get('JWT_SECRET'),
    );
  }
}
