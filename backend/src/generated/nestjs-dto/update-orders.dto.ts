import { Type } from 'class-transformer';
import {
  IsArray,
  IsDate,
  IsNumber,
  IsOptional,
  ValidateNested,
} from 'class-validator';

export class UpdateOrdersDto {
  @IsNumber()
  @IsOptional()
  total?: number;

  @IsDate()
  @Type(() => Date)
  @IsOptional()
  order_date?: Date;

  @IsArray()
  @ValidateNested()
  @Type(() => Number)
  @IsOptional()
  order_items?: number[];

  @IsNumber()
  @IsOptional()
  user_id?: number;
}
