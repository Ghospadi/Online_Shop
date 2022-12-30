import { Prisma } from '@prisma/client';
import { IsNumber } from 'class-validator';

export class GetAllByWhereOrders {
  @IsNumber()
  page: number;
  where: Prisma.ordersWhereInput;
  orderBy: Prisma.ordersOrderByWithRelationInput;
}
