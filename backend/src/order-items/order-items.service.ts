import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { OrderItems } from 'src/generated/nestjs-dto/orderItems.entity';
import { CreateOrderItemsDto } from 'src/generated/nestjs-dto/create-orderItems.dto';
import { UpdateOrderItemsDto } from 'src/generated/nestjs-dto/update-orderItems.dto';
import {ORDER_NOT_FOUND, PRODUCT_NOT_FOUND, REVIEW_ALREADY_EXISTS} from 'consts';
import {HttpStatus} from "@nestjs/common/enums";

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

    console.log(where);

    const result = await this.prisma.order_items.findMany({
      skip,
      take,
      where,
      orderBy,
      include: {
        products: true,
      },
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

  async createOrderItems(dto: CreateOrderItemsDto[]) {
    try {
      await this.prisma.$transaction([
        this.prisma.order_items.createMany({
          data: dto,
        }),
      ]);
    } catch (e) {
      if (
        e.message.includes(
          'Stock would be lower than 0 after decreasing, Item with',
        )
      ) {
        if (dto.length !== 0) {
          await this.prisma.orders.delete({
            where: {
              id: dto[0].order_id,
            },
          });
        }
        throw new NotFoundException({
          status: HttpStatus.BAD_REQUEST,
          error: 'One of products out of stock',
        });
      }
      throw new Error(e);
    }
    return true;
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
