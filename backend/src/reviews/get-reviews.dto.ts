import { Prisma } from '@prisma/client';
import { IsNumber } from 'class-validator';

export class GetAllByWhereReviews {
  @IsNumber()
  page: number;
  where: Prisma.reviewsWhereInput;
  orderBy: Prisma.reviewsOrderByWithRelationInput;
}
