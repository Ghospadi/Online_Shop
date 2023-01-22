import { Prisma } from '@prisma/client';
import {IsNumber, IsOptional} from 'class-validator';

export class GetAllByWhereOrders {
  @IsOptional()
  @IsNumber()
  page: number;
  where: Prisma.ordersWhereInput;
  orderBy: Prisma.ordersOrderByWithRelationInput;
}
