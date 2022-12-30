import { Module } from '@nestjs/common';
import { OrderItemsService } from './order-items.service';
import { OrderItemsController } from './order-items.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  providers: [OrderItemsService, PrismaService],
  controllers: [OrderItemsController],
})
export class OrderItemsModule {}
