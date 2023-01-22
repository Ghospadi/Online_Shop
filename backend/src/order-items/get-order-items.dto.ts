import { Prisma } from '@prisma/client';
import {IsNumber, IsOptional} from 'class-validator';

export class GetAllByWhereOrderItems {
  @IsOptional()
  @IsNumber()
  page: number;
  where: Prisma.order_itemsWhereInput;
  orderBy: Prisma.order_itemsOrderByWithRelationInput;
}
