import { IsNumber, IsOptional } from 'class-validator';

export class UpdateUsersDto {
  name?: string;
  age: number;
  email?: string;
  password?: string;
  country?: string;
  city?: string;
  address?: string;
  @IsNumber()
  role_id?: number;
  @IsOptional()
  banned?: number;
}
