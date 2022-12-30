import { Prisma } from '@prisma/client';

export class GetAllByWhereCategories {
  page: number;
  where: Prisma.categoriesWhereInput;
  orderBy: Prisma.categoriesOrderByWithRelationInput;
}
