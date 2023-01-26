import { IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateProductsDto {
  @IsString()
  name: string;

  @IsString()
  description: string;

  @IsNumber()
  @IsOptional()
  price?: number;

  @IsNumber()
  @IsOptional()
  rating?: number;

  @IsString()
  @IsOptional()
  image?: string;

  @IsNumber()
  @IsOptional()
  stock?: number;
  category_id: number;
}
