import {
  Body,
  Controller,
  Get,
  NotFoundException,
  Param,
  Patch,
  UseGuards,
} from '@nestjs/common';
import { Users } from '../generated/nestjs-dto/users.entity';
import { UsersService } from './users.service';
import { JwtAuthGuard } from '../auth/guards/jwt.guard';
import { Role, RolesGuard } from '../auth/guards/role.guard';
import { RolesDecorator } from '../auth/decorator/roles.decorator';
import { USER_NOT_FOUND } from '../../consts';
import { ConnectUsersDto } from '../generated/nestjs-dto/connect-users.dto';
import { UpdateUsersDto } from '../generated/nestjs-dto/update-users.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN, Role.USER)
  @Get(':id')
  async findOne(@Param('id') id: string): Promise<Users> {
    return this.usersService.findOne({ id: Number(id) });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN, Role.USER)
  @Patch(':id')
  async update(
    @Param('id') id: ConnectUsersDto,
    @Body() dto: UpdateUsersDto,
  ): Promise<Users> {
    const asyncResult = await this.usersService.findOne({ id: Number(id) });

    if (!asyncResult) {
      throw new NotFoundException(USER_NOT_FOUND);
    }

    return this.usersService.update({
      where: { id: Number(id) },
      dto,
    });
  }
}
