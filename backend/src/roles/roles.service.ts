import { ROLE_ALREADY_EXISTS, TOKEN_NOT_FOUND } from './../../consts';
import { NotFoundException } from '@nestjs/common/exceptions';
import { Injectable, UseGuards } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateRolesDto } from 'src/generated/nestjs-dto/update-roles.dto';
import { CreateRolesDto } from 'src/generated/nestjs-dto/create-roles.dto';
import { Prisma } from '@prisma/client';
import { ROLE_NOT_FOUND } from 'consts';
import { JwtAuthGuard } from 'src/auth/guards/jwt.guard';
import { RolesGuard, Role } from 'src/auth/guards/role.guard';
import { RolesDecorator } from 'src/auth/decorator/roles.decorator';
import { Roles } from 'src/generated/nestjs-dto/roles.entity';

@Injectable()
export class RolesService {
  constructor(private readonly prisma: PrismaService) {}

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async findAll(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.rolesWhereInput;
    orderBy?: Prisma.rolesOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.roles.findMany({
      skip,
      take,
      where,
      orderBy,
    });

    const totalResults = await this.prisma.roles.count();

    return {
      currentPage,
      result,
      totalPages: Math.ceil(totalResults / 10),
      totalResults,
    };
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async findOne(id: Prisma.reviewsWhereUniqueInput): Promise<Roles> {
    const role = await this.prisma.roles.findFirst({
      where: id,
    });

    if (!role) {
      throw new NotFoundException(ROLE_NOT_FOUND);
    }

    const token = '1';

    const existedToken = await this.prisma.tokens.findFirst({
      where: { token },
    });

    if (!existedToken) {
      throw new NotFoundException(TOKEN_NOT_FOUND);
    }

    return role;
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async create(dto: CreateRolesDto): Promise<Roles> {
    const role = await this.prisma.roles.findFirst({
      where: {
        name: dto.name,
      },
    });

    if (role) {
      throw new NotFoundException(ROLE_ALREADY_EXISTS);
    }

    return this.prisma.roles.create({
      data: dto,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async update(
    id: Prisma.reviewsWhereUniqueInput,
    dto: UpdateRolesDto,
  ): Promise<Roles> {
    const role = await this.prisma.roles.findFirst({
      where: id,
    });

    if (!role) {
      throw new NotFoundException(ROLE_NOT_FOUND);
    }

    return this.prisma.roles.update({
      where: id,
      data: dto,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async delete(id: Prisma.reviewsWhereUniqueInput): Promise<void> {
    const role = await this.prisma.roles.findFirst({
      where: id,
    });

    if (!role) {
      throw new NotFoundException(ROLE_NOT_FOUND);
    }

    await this.prisma.roles.delete({
      where: id,
    });
  }
}
