import { Prisma } from '@prisma/client';
import { IsNumber } from 'class-validator';

export class GetAllByWhereProducts {
  page: number;
  where: Prisma.productsWhereInput;
  orderBy: Prisma.productsOrderByWithRelationInput;
}
