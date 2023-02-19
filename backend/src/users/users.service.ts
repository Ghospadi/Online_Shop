import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { NotFoundException } from '@nestjs/common/exceptions';
import { USER_NOT_FOUND } from '../../consts';
import { PrismaService } from '../prisma/prisma.service';
import { Users } from '../generated/nestjs-dto/users.entity';
import { UpdateUsersDto } from '../generated/nestjs-dto/update-users.dto';

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async findUsers(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.usersWhereInput;
    orderBy?: Prisma.usersOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.users.findMany({
      select: {
        id: true,
        name: true,
        email: true,
        country: true,
        city: true,
        address: true,
        banned: true,
      },
      skip,
      take,
      where,
      orderBy,
    });

    const totalResults = await this.prisma.users.aggregate({
      where,
      _count: true,
    });

    const { _count } = totalResults;

    return {
      currentPage,
      result,
      totalPages: Math.ceil(_count / 4),
      totalResults: _count,
    };
  }

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

  async banOrUnbanUser(params: {
    where: Prisma.usersWhereUniqueInput;
    flag: number;
  }) {
    const { where, flag } = params;
    const user = await this.prisma.users.findFirst({
      where,
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    return this.prisma.users.update({
      data: {
        banned: flag,
      },
      where,
    });
  }
}
