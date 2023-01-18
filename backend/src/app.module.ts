import { Logger, Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';
import { ProductsModule } from './products/products.module';
import { CategoriesModule } from './categories/categories.module';
import { AuthService } from './auth/auth.service';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { ReviewsModule } from './reviews/reviews.module';
import { OrdersModule } from './orders/orders.module';
import { OrderItemsModule } from './order-items/order-items.module';
import { RolesModule } from './roles/roles.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [
    ProductsModule,
    CategoriesModule,
    AuthModule,
    ConfigModule.forRoot(),
    ReviewsModule,
    OrdersModule,
    OrderItemsModule,
    RolesModule,
    UsersModule,
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService, Logger, AuthService],
})
export class AppModule {}
