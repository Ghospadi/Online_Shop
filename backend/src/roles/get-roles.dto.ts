import { Prisma } from '@prisma/client';
import { IsNumber } from 'class-validator';

export class GetAllByWhereRoles {
  @IsNumber()
  page: number;
  where: Prisma.rolesWhereInput;
  orderBy: Prisma.rolesOrderByWithRelationInput;
}
