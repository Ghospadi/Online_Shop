import { Injectable } from '@nestjs/common';
import { NotFoundException } from '@nestjs/common/exceptions';
import { Prisma } from '@prisma/client';
import { ORDER_ITEM_NOT_FOUND, USER_NOT_FOUND } from 'consts';
import { CreateOrdersDto } from 'src/generated/nestjs-dto/create-orders.dto';
import { Orders } from 'src/generated/nestjs-dto/orders.entity';
import { UpdateOrdersDto } from 'src/generated/nestjs-dto/update-orders.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class OrdersService {
  constructor(private readonly prisma: PrismaService) {}

  async findOrders(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.ordersWhereInput;
    orderBy?: Prisma.ordersOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.orders.findMany({
      skip,
      take,
      where,
      orderBy,
    });

    const totalResults = await this.prisma.orders.aggregate({
      where,
      _count: true,
    });

    const { _count } = totalResults;

    return {
      currentPage,
      result,
      totalPages: Math.ceil(_count / 9),
      totalResults: _count,
    };
  }

  async findOrder(id: Prisma.ordersWhereUniqueInput): Promise<Orders> {
    return this.prisma.orders.findFirst({
      where: id,
    });
  }

  async createOrder(dto: CreateOrdersDto): Promise<Orders> {
    const user = await this.prisma.users.findFirst({
      where: { id: dto.user_id },
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    return this.prisma.orders.create({
      data: {
        total: dto.total,
        order_date: dto.order_date,
        users: {
          connect: {
            id: dto.user_id,
          },
        },
      },
    });
  }

  async updateOrder(params: {
    where: Prisma.ordersWhereUniqueInput;
    dto: UpdateOrdersDto;
  }): Promise<Orders> {
    const { where, dto } = params;

    dto.order_items.map(async (id) => {
      const orderItem = await this.prisma.order_items.findFirst({
        where: { id },
      });
      if (!orderItem) {
        throw new NotFoundException(ORDER_ITEM_NOT_FOUND);
      }
    });

    const user = await this.prisma.users.findFirst({
      where: { id: dto.user_id },
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    return this.prisma.orders.update({
      where,
      data: {
        total: dto.total,
        order_date: dto.order_date,
        order_items: {
          connect: dto.order_items.map((id) => ({ id })),
        },
        users: {
          connect: {
            id: dto.user_id,
          },
        },
      },
    });
  }

  async deleteOrder(id: Prisma.ordersWhereUniqueInput): Promise<Orders> {
    return this.prisma.orders.delete({
      where: id,
    });
  }
}
