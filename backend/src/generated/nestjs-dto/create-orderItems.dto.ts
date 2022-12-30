import { IsNumber, IsOptional } from 'class-validator';

export class CreateOrderItemsDto {
  @IsNumber()
  @IsOptional()
  quantity?: number;
  @IsNumber()
  @IsOptional()
  price?: number;
  @IsNumber()
  order_id: number;
  @IsNumber()
  product_id: number;
}
