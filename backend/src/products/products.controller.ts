/* eslint-disable prettier/prettier */
import { UpdateProductsDto } from '../generated/nestjs-dto/update-products.dto';
import { CreateProductsDto } from '../generated/nestjs-dto/create-products.dto';
import { ProductsService } from './products.service';
import {
  Body,
  Controller,
  Delete,
  Get, HttpCode,
  NotFoundException,
  Param,
  Patch,
  Post,
  UseGuards,
} from '@nestjs/common';
import { ConnectProductsDto } from '../generated/nestjs-dto/connect-products.dto';
import { GetAllByWhereProducts } from './get-products.dto';
import { JwtAuthGuard } from '../auth/guards/jwt.guard';
import { PRODUCT_NOT_FOUND } from 'consts';
import { Role, RolesGuard } from 'src/auth/guards/role.guard';
import { RolesDecorator } from 'src/auth/decorator/roles.decorator';

@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Get(':id')
  async getProductById(@Param('id') id: string) {
    const asyncResult = await this.productsService.findProduct({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }
    return asyncResult;
  }

  @Post('all')
  async getAllProducts(@Body() dto: GetAllByWhereProducts) {
    if (!dto.page && isNaN(dto.page)) {
      dto.page = 1;
    }
    return this.productsService.findProducts({
      where: dto.where,
      orderBy: dto.orderBy,
      currentPage: Number(dto.page),
      skip: dto.page === 1 ? 0 : dto.page * 10 - 10,
      take: 10,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @Post('create')
  async create(@Body() dto: CreateProductsDto) {
    const createdItem = this.productsService.createProduct(dto);
    return createdItem;
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @Patch(':id')
  async updateProductById(
    @Param('id') id: ConnectProductsDto,
    @Body() dto: UpdateProductsDto,
  ) {
    const asyncResult = await this.productsService.findProduct({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }
    return this.productsService.updateProduct({
      where: { id: Number(id) },
      data: dto,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @HttpCode(200)
  @Delete(':id')
  async deleteProductById(@Param('id') id: string) {
    const asyncResult = await this.productsService.findProduct({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(PRODUCT_NOT_FOUND);
    }
    return this.productsService.deleteProduct({ id: Number(id) });
  }
}
