// src/auth/auth.controller.ts
import {
  Controller,
  Post,
  UseGuards,
  Request,
  Body,
  ValidationPipe,
  UsePipes,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { JwtAuthGuard } from './guards/jwt.guard';
import { Headers } from '@nestjs/common/decorators';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @UsePipes(new ValidationPipe())
  @Post('login')
  async login(@Request() req) {
    return this.authService.login(req.body.email, req.body.password);
  }

  @UsePipes(new ValidationPipe())
  @Post('register')
  async register(@Body() body): Promise<void> {
    return this.authService.register(body);
  }

  @UsePipes(new ValidationPipe())
  @UseGuards(JwtAuthGuard)
  @Post('me')
  async me(@Headers('Authorization') token: string): Promise<any> {
    const tokenData = token.split(' ')[1];
    return this.authService.me(tokenData);
  }
}
