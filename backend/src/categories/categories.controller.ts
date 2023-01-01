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

  @Get('all')
  async findAll() {
    return this.categoriesService.findCategories();
  }

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
