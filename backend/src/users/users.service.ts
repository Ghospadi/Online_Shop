import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { NotFoundException } from '@nestjs/common/exceptions';
import { PRODUCT_NOT_FOUND, USER_NOT_FOUND } from '../../consts';
import { PrismaService } from '../prisma/prisma.service';
import { Users } from '../generated/nestjs-dto/users.entity';
import { UpdateReviewsDto } from '../generated/nestjs-dto/update-reviews.dto';
import { UpdateUsersDto } from '../generated/nestjs-dto/update-users.dto';

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async findOne(id: Prisma.usersWhereUniqueInput): Promise<Users> {
    const user = await this.prisma.users.findFirst({
      where: id,
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    delete user['password'];

    return user;
  }

  async update(params: {
    where: Prisma.usersWhereUniqueInput;
    dto: UpdateUsersDto;
  }) {
    const { where, dto } = params;
    const user = await this.prisma.users.findFirst({
      where,
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    return this.prisma.users.update({
      data: {
        name: dto.name,
        age: dto.age,
        email: dto.email,
        country: dto.country,
        city: dto.city,
        address: dto.address,
        role_id: dto.role_id,
      },
      where,
    });
  }
}
