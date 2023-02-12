import { Prisma } from '@prisma/client';
import { IsNumber, IsOptional } from 'class-validator';

export class GetAllByWhereUsers {
  @IsOptional()
  @IsNumber()
  page: number;

  where: Prisma.reviewsWhereInput;

  orderBy: Prisma.reviewsOrderByWithRelationInput;
}
