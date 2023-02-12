import { IsNumber } from 'class-validator';

export class CreateUsersDto {
  name: string;
  age: number;
  email: string;
  password: string;
  country: string;
  city: string;
  address: string;
  @IsNumber()
  role_id?: number;
}
