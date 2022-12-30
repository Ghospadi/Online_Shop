import { HttpCode, Injectable, NotFoundException } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { ORDER_ITEM_NOT_FOUND } from 'consts';
import { CreateCategoriesDto } from 'src/generated/nestjs-dto/create-categories.dto';
import { UpdateCategoriesDto } from 'src/generated/nestjs-dto/update-categories.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CategoriesService {
  constructor(private readonly prisma: PrismaService) {}

  async findById(id?: Prisma.categoriesWhereUniqueInput) {
    const category = await this.prisma.categories.findFirst({
      where: id,
    });
    return category;
  }

  async findCategories(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.categoriesWhereInput;
    orderBy?: Prisma.categoriesOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.categories.findMany({
      skip,
      take,
      where,
      orderBy,
    });

    const totalResults = await this.prisma.categories.count();

    return {
      currentPage,
      result,
      totalPages: Math.ceil(totalResults / 10),
      totalResults,
    };
  }

  async create(dto: CreateCategoriesDto) {
    let createdCategory = {};
    if (dto.product_ids) {
      dto.product_ids.map(async (id) => {
        const orderItem = await this.prisma.products.findFirst({
          where: { id },
        });
        if (!orderItem) {
          throw new NotFoundException(ORDER_ITEM_NOT_FOUND);
        }
      });
      createdCategory = await this.prisma.categories.create({
        data: {
          name: dto.name,
          description: dto.description,
          products: {
            connect: dto.product_ids
              ? dto.product_ids.map((id) => ({ id }))
              : null,
          },
        },
      });
    } else {
      createdCategory = await this.prisma.categories.create({
        data: {
          name: dto.name,
          description: dto.description,
        },
      });
    }

    return createdCategory;
  }

  async UpdateCategory(params: {
    where: Prisma.categoriesWhereUniqueInput;
    dto: UpdateCategoriesDto;
  }) {
    const { where, dto } = params;
    let updatedCategory = {};
    if (dto.product_ids) {
      dto.product_ids.map(async (id) => {
        const orderItem = await this.prisma.products.findFirst({
          where: { id },
        });
        if (!orderItem) {
          throw new NotFoundException(ORDER_ITEM_NOT_FOUND);
        }
      });
      updatedCategory = await this.prisma.categories.update({
        data: {
          name: dto.name,
          description: dto.description,
          products: {
            connect: dto.product_ids.map((id) => ({ id })),
          },
        },
        where,
      });
    } else {
      updatedCategory = await this.prisma.categories.update({
        data: {
          name: dto.name,
          description: dto.description,
        },
        where,
      });
    }

    return updatedCategory;
  }

  @HttpCode(200)
  async deleteCategory(where: Prisma.categoriesWhereUniqueInput) {
    await this.prisma.categories.delete({
      where,
    });
  }
}
