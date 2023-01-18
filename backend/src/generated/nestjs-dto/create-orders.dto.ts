import { Type } from 'class-transformer';
import {
  IsArray,
  IsDate,
  IsNumber,
  IsOptional,
  ValidateNested,
} from 'class-validator';

export class CreateOrdersDto {
  @IsNumber()
  @IsOptional()
  total?: number;

  @IsDate()
  @Type(() => Date)
  @IsOptional()
  order_date?: Date;

  @IsArray()
  @IsOptional()
  @ValidateNested()
  @Type(() => Number)
  order_items?: number[];

  @IsNumber()
  user_id: number;
}
