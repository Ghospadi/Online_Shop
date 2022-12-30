import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  Put,
  Delete,
  UseGuards,
  NotFoundException,
} from '@nestjs/common';
import { OrderItemsService } from './order-items.service';
import { GetAllByWhereOrderItems } from './get-order-items.dto';
import { CreateOrderItemsDto } from '../generated/nestjs-dto/create-orderItems.dto';
import { ConnectOrderItemsDto } from '../generated/nestjs-dto/connect-orderItems.dto';
import { UpdateOrderItemsDto } from '../generated/nestjs-dto/update-orderItems.dto';
import { JwtAuthGuard } from 'src/auth/guards/jwt.guard';
import { ORDER_ITEM_NOT_FOUND } from 'consts';
import { RolesDecorator } from 'src/auth/decorator/roles.decorator';
import { RolesGuard, Role } from 'src/auth/guards/role.guard';

@Controller('order-items')
export class OrderItemsController {
  constructor(private readonly orderItemsService: OrderItemsService) {}

  @Post('all')
  async findAllOrderItems(@Body() dto: GetAllByWhereOrderItems) {
    if (!dto.page) {
      dto.page = 1;
    }
    return this.orderItemsService.findOrderItems({
      where: dto.where,
      orderBy: dto.orderBy,
      currentPage: dto.page,
      skip: dto.page === 1 ? 0 : dto.page * 10 - 10,
      take: 10,
    });
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    const asyncResult = await this.orderItemsService.findOrderItem({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(ORDER_ITEM_NOT_FOUND);
    }
    return asyncResult;
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  @Post('create')
  async create(@Body() dto: CreateOrderItemsDto) {
    return this.orderItemsService.createOrderItem(dto);
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  @Put(':id')
  async update(
    @Param('id') id: ConnectOrderItemsDto,
    @Body() dto: UpdateOrderItemsDto,
  ) {
    const asyncResult = await this.orderItemsService.findOrderItem({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(ORDER_ITEM_NOT_FOUND);
    }
    return this.orderItemsService.updateOrderItem({
      where: { id: Number(id) },
      dto,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.USER, Role.ADMIN)
  @Delete(':id')
  async delete(@Param('id') id: string) {
    const asyncResult = await this.orderItemsService.findOrderItem({
      id: Number(id),
    });
    if (!asyncResult) {
      throw new NotFoundException(ORDER_ITEM_NOT_FOUND);
    }
    return this.orderItemsService.deleteOrderItem({ id: Number(id) });
  }
}
