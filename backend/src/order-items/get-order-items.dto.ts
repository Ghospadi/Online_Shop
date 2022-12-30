import { Prisma } from '@prisma/client';
import { IsNumber } from 'class-validator';

export class GetAllByWhereOrderItems {
  @IsNumber()
  page: number;
  where: Prisma.order_itemsWhereInput;
  orderBy: Prisma.order_itemsOrderByWithRelationInput;
}
