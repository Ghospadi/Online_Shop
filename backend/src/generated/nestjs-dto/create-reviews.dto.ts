import { IsDate, IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateReviewsDto {
  @IsNumber()
  @IsOptional()
  rating?: number;

  @IsString()
  review: string;

  @IsDate()
  @IsOptional()
  timestamp?: Date;

  @IsNumber()
  user_id: number;

  @IsNumber()
  product_id: number;
}
