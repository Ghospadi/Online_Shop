import { Prisma } from '@prisma/client';
import { IsNumber } from 'class-validator';

export class GetAllByWhereProducts {
  @IsNumber()
  page: number;
  where: Prisma.productsWhereInput;
  orderBy: Prisma.productsOrderByWithRelationInput;
}
