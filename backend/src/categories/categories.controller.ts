import {
  Body,
  Controller,
  Delete,
  Get,
  NotFoundException,
  Param,
  Patch,
  Post,
  UseGuards,
} from '@nestjs/common';
import { CategoriesService } from './categories.service';
import { GetAllByWhereCategories } from './get-categories.dto';
import { ConnectCategoriesDto } from '../generated/nestjs-dto/connect-categories.dto';
import { UpdateCategoriesDto } from '../generated/nestjs-dto/update-categories.dto';
import { JwtAuthGuard } from 'src/auth/guards/jwt.guard';
import { CreateCategoriesDto } from '../generated/nestjs-dto/create-categories.dto';
import { CATEGORY_NOT_FOUND } from 'consts';
import { RolesDecorator } from 'src/auth/decorator/roles.decorator';
import { RolesGuard, Role } from 'src/auth/guards/role.guard';

@Controller('categories')
export class CategoriesController {
  constructor(private readonly categoriesService: CategoriesService) {}

  @Get(':id')
  async find(@Param('id') id?: string) {
    const asyncResult = await this.categoriesService.findById({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(CATEGORY_NOT_FOUND);
    }
    return asyncResult;
  }

  @Post()
  async findAll(@Body() dto: GetAllByWhereCategories) {
    if (!dto.page) {
      dto.page = 1;
    }
    return this.categoriesService.findCategories({
      where: dto.where,
      orderBy: dto.orderBy,
      currentPage: dto.page,
      skip: dto.page === 1 ? 0 : dto.page * 10 - 10,
      take: 10,
    });
  }

  @Post('create')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async create(@Body() category: CreateCategoriesDto) {
    return this.categoriesService.create(category);
  }

  @Patch(':id')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async updateCategoryById(
    @Param('id') id: ConnectCategoriesDto,
    @Body() dto: UpdateCategoriesDto,
  ) {
    const asyncResult = await this.categoriesService.findById({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(CATEGORY_NOT_FOUND);
    }
    return this.categoriesService.UpdateCategory({
      where: { id: Number(id) },
      dto,
    });
  }

  @Delete(':id')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  async deleteCategoryById(@Param('id') id: string) {
    const asyncResult = await this.categoriesService.findById({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(CATEGORY_NOT_FOUND);
    }
    return this.categoriesService.deleteCategory({ id: Number(id) });
  }
}
