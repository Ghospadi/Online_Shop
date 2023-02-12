import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateReviewsDto {
  @IsNumber()
  rating?: number;

  @IsString()
  review: string;

  @IsString()
  @IsOptional()
  timestamp?: string;

  @IsNumber()
  user_id: number;

  @IsNumber()
  product_id: number;
}
