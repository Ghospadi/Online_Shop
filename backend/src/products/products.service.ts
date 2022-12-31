import { NotFoundException } from '@nestjs/common/exceptions';
import { HttpCode, Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { UpdateProductsDto } from 'src/generated/nestjs-dto/update-products.dto';
import { CreateProductsDto } from 'src/generated/nestjs-dto/create-products.dto';
import { PRODUCT_NOT_FOUND } from 'consts';

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

  async findProduct(products: Prisma.productsWhereUniqueInput) {
    return this.prisma.products.findUnique({
      where: products,
    });
  }

  async createProduct(data: CreateProductsDto) {
    return this.prisma.products.create({
      data: {
        name: data.name,
        description: data.description,
        image: data.image,
        price: data.price,
        stock: data.stock,
        categories: {
          connect: {
            id: data.category_id,
          },
        },
      },
    });
  }

  async updateProduct(params: {
    where: Prisma.productsWhereUniqueInput;
    data: UpdateProductsDto;
  }) {
    const { where, data } = params;

    const product = await this.findProduct(where);

    if (!product) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }

    return this.prisma.products.update({
      data: {
        name: data.name,
        description: data.description,
        image: data.image,
        price: data.price,
        stock: data.stock,
        categories: {
          connect: {
            id: data.category_id,
          },
        },
      },
      where,
    });
  }

  @HttpCode(200)
  async deleteProduct(where: Prisma.productsWhereUniqueInput) {
    const product = await this.findProduct(where);

    if (!product) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }

    await this.prisma.products.delete({
      where,
    });
  }
}
