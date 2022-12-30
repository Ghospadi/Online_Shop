import { IsString } from 'class-validator';

export class CreateCategoriesDto {
  @IsString()
  name: string;
  @IsString()
  description: string;
  product_ids?: number[];
}
