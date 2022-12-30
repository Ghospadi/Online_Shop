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
import { OrdersService } from './orders.service';
import { JwtAuthGuard } from 'src/auth/guards/jwt.guard';
import { ConnectOrdersDto } from '../generated/nestjs-dto/connect-orders.dto';
import { CreateOrdersDto } from '../generated/nestjs-dto/create-orders.dto';
import { UpdateOrdersDto } from '../generated/nestjs-dto/update-orders.dto';
import { GetAllByWhereOrders } from './get-orders.dto';
import { ORDER_NOT_FOUND } from 'consts';
import { RolesGuard, Role } from 'src/auth/guards/role.guard';
import { RolesDecorator } from 'src/auth/decorator/roles.decorator';

@Controller('orders')
export class OrdersController {
  constructor(private readonly ordersService: OrdersService) {}

  @Get(':id')
  async getOrderById(@Param('id') id: string) {
    const asyncResult = await this.ordersService.findOrder({ id: Number(id) });
    if (!asyncResult) {
      throw new NotFoundException(ORDER_NOT_FOUND);
    }
    return asyncResult;
  }

  @Post('all')
  async getAllOrders(@Body() dto: GetAllByWhereOrders) {
    if (!dto.page) {
      dto.page = 1;
    }
    return this.ordersService.findOrders({
      where: dto.where,
      orderBy: dto.orderBy,
      currentPage: dto.page,
      skip: dto.page === 1 ? 0 : dto.page * 10 - 10,
      take: 10,
    });
  }

  @Post('create')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  async create(@Body() dto: CreateOrdersDto) {
    return this.ordersService.createOrder(dto);
  }

  @Patch(':id')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  async updateProductById(
    @Param('id') id: ConnectOrdersDto,
    @Body() dto: UpdateOrdersDto,
  ) {
    const asyncResult = await this.ordersService.findOrder({ id: Number(id) });
    if (!asyncResult) {
      throw new NotFoundException(ORDER_NOT_FOUND);
    }
    return this.ordersService.updateOrder({
      where: { id: Number(id) },
      dto,
    });
  }

  @Delete(':id')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  async deleteProductById(@Param('id') id: string) {
    const asyncResult = await this.ordersService.findOrder({ id: Number(id) });
    if (!asyncResult) {
      throw new NotFoundException(ORDER_NOT_FOUND);
    }
    return this.ordersService.deleteOrder({ id: Number(id) });
  }
}
