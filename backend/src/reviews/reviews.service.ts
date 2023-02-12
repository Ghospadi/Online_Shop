import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Reviews } from 'src/generated/nestjs-dto/reviews.entity';
import { Prisma } from '@prisma/client';
import { CreateReviewsDto } from 'src/generated/nestjs-dto/create-reviews.dto';
import { UpdateReviewsDto } from 'src/generated/nestjs-dto/update-reviews.dto';
import { PRODUCT_NOT_FOUND, USER_NOT_FOUND } from 'consts';

@Injectable()
export class ReviewsService {
  constructor(private readonly prisma: PrismaService) {}

  async createReview(review: CreateReviewsDto) {
    const user = await this.prisma.users.findFirst({
      where: { id: review.user_id },
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    const product = await this.prisma.products.findFirst({
      where: { id: review.product_id },
    });

    if (!product) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }

    return this.prisma.reviews.create({
      data: {
        rating: review.rating,
        review: review.review,
        timestamp: review.timestamp,
        users: {
          connect: {
            id: review.user_id,
          },
        },
        products: {
          connect: {
            id: review.product_id,
          },
        },
      },
    });
  }

  async findReviews(params: {
    skip?: number;
    take?: number;
    currentPage?: number;
    where?: Prisma.reviewsWhereInput;
    orderBy?: Prisma.reviewsOrderByWithRelationInput;
  }) {
    const { skip, take, where, orderBy, currentPage } = params;

    const result = await this.prisma.reviews.findMany({
      skip,
      take,
      where,
      orderBy,
      include: {
        users: {
          select: {
            id: true,
            name: true,
          },
        },
        products: {
          select: {
            id: true,
            name: true,
          },
        },
      },
    });

    const totalResults = await this.prisma.reviews.aggregate({
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

  async findOne(id: Prisma.reviewsWhereUniqueInput): Promise<Reviews> {
    return this.prisma.reviews.findFirst({
      where: id,
    });
  }

  async update(params: {
    where: Prisma.reviewsWhereUniqueInput;
    dto: UpdateReviewsDto;
  }) {
    const { where, dto } = params;
    const user = await this.prisma.users.findFirst({
      where: { id: dto.user_id },
    });

    if (!user) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    const product = await this.prisma.products.findFirst({
      where: { id: dto.product_id },
    });

    if (!product) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }

    return this.prisma.reviews.update({
      data: {
        rating: dto.rating,
        review: dto.review,
        timestamp: dto.timestamp,
        users: {
          connect: {
            id: dto.user_id,
          },
        },
        products: {
          connect: {
            id: dto.product_id,
          },
        },
      },
      where,
    });
  }

  async remove(where: Prisma.reviewsWhereUniqueInput): Promise<void> {
    await this.prisma.reviews.delete({
      where,
    });
  }
}
