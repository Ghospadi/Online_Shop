import { IsNumber } from 'class-validator';

export class UpdateUsersDto {
  name?: string;
  email?: string;
  password?: string;
  country?: string;
  city?: string;
  address?: string;
  @IsNumber()
  role_id?: number;
}
