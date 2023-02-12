import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Delete,
  Patch,
  UseGuards,
  NotFoundException,
} from '@nestjs/common';
import { ReviewsService } from './reviews.service';
import { Reviews } from '../generated/nestjs-dto/reviews.entity';
import { GetAllByWhereReviews } from './get-reviews.dto';
import { ConnectReviewsDto } from '../generated/nestjs-dto/connect-reviews.dto';
import { UpdateReviewsDto } from '../generated/nestjs-dto/update-reviews.dto';
import { JwtAuthGuard } from 'src/auth/guards/jwt.guard';
import { CreateReviewsDto } from '../generated/nestjs-dto/create-reviews.dto';
import { REVIEW_ALREADY_EXISTS, REVIEW_NOT_FOUND } from 'consts';
import { RolesDecorator } from 'src/auth/decorator/roles.decorator';
import { RolesGuard, Role } from 'src/auth/guards/role.guard';
import { HttpException } from '@nestjs/common/exceptions';
import { HttpStatus } from '@nestjs/common/enums';

export interface ReviewsPayload {
  currentPage: number;
  result: Reviews;
  totalPages: number;
  totalResults: number;
}

@Controller('reviews')
export class ReviewsController {
  constructor(private readonly reviewService: ReviewsService) {}

  @Post('create')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  async create(@Body() review: CreateReviewsDto) {
    try {
      await this.reviewService.createReview(review);
    } catch (e) {
      if (
        e.message.includes(
          'A review for this product by this user already exists.',
        )
      ) {
        console.log(1);
        throw new NotFoundException({
          status: HttpStatus.BAD_REQUEST,
          error: REVIEW_ALREADY_EXISTS,
        });
      } else {
        throw new HttpException('Error', HttpStatus.BAD_REQUEST);
      }
    }
  }

  @Post('all')
  async findAll(@Body() dto: GetAllByWhereReviews) {
    if (!dto.page) {
      dto.page = 1;
    }
    return this.reviewService.findReviews({
      where: dto.where,
      orderBy: dto.orderBy,
      currentPage: dto.page,
      skip: dto.page === 1 ? 0 : dto.page * 4 - 4,
      take: 4,
    });
  }

  @Get(':id')
  async findOne(@Param('id') id: string): Promise<Reviews> {
    const asyncResult = await this.reviewService.findOne({ id: Number(id) });
    if (!asyncResult) {
      throw new NotFoundException(REVIEW_NOT_FOUND);
    }
    return asyncResult;
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  @Patch(':id')
  async update(
    @Param('id') id: ConnectReviewsDto,
    @Body() dto: UpdateReviewsDto,
  ): Promise<Reviews> {
    const asyncResult = await this.reviewService.findOne({ id: Number(id) });

    if (!asyncResult) {
      throw new NotFoundException(REVIEW_NOT_FOUND);
    }

    return this.reviewService.update({
      where: { id: Number(id) },
      dto,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER)
  @Delete(':id')
  async remove(@Param('id') id: string) {
    const asyncResult = await this.reviewService.findOne({ id: Number(id) });

    if (!asyncResult) {
      throw new NotFoundException(REVIEW_NOT_FOUND);
    }

    return this.reviewService.remove({ id: Number(id) });
  }
}
