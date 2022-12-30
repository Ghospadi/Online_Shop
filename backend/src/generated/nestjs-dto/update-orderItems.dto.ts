import { IsNumber, IsOptional } from 'class-validator';

export class UpdateOrderItemsDto {
  @IsNumber()
  @IsOptional()
  quantity?: number;

  @IsNumber()
  @IsOptional()
  price?: number;

  @IsNumber()
  @IsOptional()
  order_id?: number;

  @IsNumber()
  @IsOptional()
  product_id?: number;
}
