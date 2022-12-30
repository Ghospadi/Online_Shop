import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { OrderItems } from 'src/generated/nestjs-dto/orderItems.entity';
import { CreateOrderItemsDto } from 'src/generated/nestjs-dto/create-orderItems.dto';
import { UpdateOrderItemsDto } from 'src/generated/nestjs-dto/update-orderItems.dto';
import { ORDER_NOT_FOUND, PRODUCT_NOT_FOUND } from 'consts';

@Injectable()
export class OrderItemsService {
  constructor(private readonly prisma: PrismaService) {}

  async findOrderItems(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.order_itemsWhereInput;
    orderBy?: Prisma.order_itemsOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.order_items.findMany({
      skip,
      take,
      where,
      orderBy,
    });

    const totalResults = await this.prisma.order_items.count();

    return {
      currentPage,
      result,
      totalPages: Math.ceil(totalResults / 10),
      totalResults,
    };
  }

  async findOrderItem(
    id: Prisma.order_itemsWhereUniqueInput,
  ): Promise<OrderItems> {
    return this.prisma.order_items.findFirst({
      where: id,
    });
  }

  async createOrderItem(dto: CreateOrderItemsDto) {
    const order = await this.prisma.orders.findFirst({
      where: { id: dto.order_id },
    });

    if (!order) {
      throw new NotFoundException(ORDER_NOT_FOUND);
    }

    const product = await this.prisma.products.findFirst({
      where: { id: dto.product_id },
    });

    if (!product) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }

    return this.prisma.order_items.create({
      data: {
        quantity: dto.quantity,
        price: dto.price,
        orders: {
          connect: {
            id: dto.order_id,
          },
        },
        products: {
          connect: {
            id: dto.product_id,
          },
        },
      },
    });
  }

  async updateOrderItem(params: {
    where: Prisma.order_itemsWhereUniqueInput;
    dto: UpdateOrderItemsDto;
  }): Promise<OrderItems> {
    const { where, dto } = params;

    const order = await this.prisma.orders.findFirst({
      where: { id: dto.order_id },
    });

    if (!order) {
      throw new NotFoundException(ORDER_NOT_FOUND);
    }

    const product = await this.prisma.products.findFirst({
      where: { id: dto.product_id },
    });

    if (!product) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }

    return this.prisma.order_items.update({
      where,
      data: {
        quantity: dto.quantity,
        price: dto.price,
        orders: {
          connect: {
            id: dto.order_id,
          },
        },
        products: {
          connect: {
            id: dto.product_id,
          },
        },
      },
    });
  }

  async deleteOrderItem(
    id: Prisma.order_itemsWhereUniqueInput,
  ): Promise<OrderItems> {
    return this.prisma.order_items.delete({
      where: id,
    });
  }
}
