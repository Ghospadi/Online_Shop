import { HttpCode, Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { CreateProductsDto } from 'src/generated/nestjs-dto/create-products.dto';
import { UpdateProductsDto } from 'src/generated/nestjs-dto/update-products.dto';
import { NotFoundException } from '@nestjs/common/exceptions';
import { CATEGORY_NOT_FOUND } from 'consts';

@Injectable()
export class ProductsService {
  constructor(private readonly prisma: PrismaService) {}

  async findProducts(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.productsWhereInput;
    orderBy?: Prisma.productsOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.products.findMany({
      skip,
      take,
      where,
      orderBy,
    });

    const totalResults = await this.prisma.products.count();

    return {
      currentPage,
      result,
      totalPages: Math.ceil(totalResults / 10),
      totalResults,
    };
  }

  async findProduct(id: Prisma.productsWhereUniqueInput) {
    return this.prisma.products.findFirst({
      where: id,
    });
  }

  async createProduct(dto: CreateProductsDto) {
    const category = await this.prisma.categories.findFirst({
      where: { id: dto.category_id },
    });

    if (!category) {
      throw new NotFoundException(CATEGORY_NOT_FOUND);
    }

    return this.prisma.products.create({
      data: {
        name: dto.name,
        description: dto.description,
        price: dto.price,
        image: dto.image,
        stock: dto.stock,
        categories: {
          connect: {
            id: dto.category_id,
          },
        },
      },
    });
  }

  async updateProduct(params: {
    where: Prisma.productsWhereUniqueInput;
    dto: UpdateProductsDto;
  }) {
    const { where, dto } = params;
    const category = await this.prisma.categories.findFirst({
      where: { id: dto.category_id },
    });

    if (!category) {
      throw new NotFoundException(CATEGORY_NOT_FOUND);
    }
    return this.prisma.products.update({
      data: {
        name: dto.name,
        description: dto.description,
        price: dto.price,
        image: dto.image,
        stock: dto.stock,
        categories: {
          connect: {
            id: dto.category_id,
          },
        },
      },
      where,
    });
  }

  @HttpCode(200)
  async deleteProduct(id: Prisma.productsWhereUniqueInput) {
    await this.prisma.products.delete({
      where: id,
    });
  }
}
