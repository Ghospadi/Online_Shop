import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  Delete,
  HttpCode,
  UseGuards,
  Patch,
} from '@nestjs/common';
import { RolesService } from './roles.service';
import { Roles } from '../generated/nestjs-dto/roles.entity';
import { UpdateRolesDto } from 'src/generated/nestjs-dto/update-roles.dto';
import { CreateRolesDto } from 'src/generated/nestjs-dto/create-roles.dto';
import { JwtAuthGuard } from 'src/auth/guards/jwt.guard';
import { GetAllByWhereRoles } from './get-roles.dto';
import {Role, RolesGuard} from "../auth/guards/role.guard";
import {RolesDecorator} from "../auth/decorator/roles.decorator";

@Controller('roles')
export class RolesController {
  constructor(private readonly rolesService: RolesService) {}

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @Post('all')
  async findAll(@Body() dto: GetAllByWhereRoles) {
    if (!dto.page) {
      dto.page = 1;
    }
    return this.rolesService.findAll({
      where: dto.where,
      orderBy: dto.orderBy,
      currentPage: dto.page,
      skip: dto.page === 1 ? 0 : dto.page * 10 - 10,
      take: 10,
    });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @Get(':id')
  async findOne(@Param('id') id: string): Promise<Roles> {
    return this.rolesService.findOne({ id: Number(id) });
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @Post('create')
  async create(@Body() role: CreateRolesDto): Promise<Roles> {
    return this.rolesService.create(role);
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @Patch(':id')
  async update(
    @Param('id') id: string,
    @Body() role: UpdateRolesDto,
  ): Promise<Roles> {
    return this.rolesService.update({ id: Number(id) }, role);
  }

  @UseGuards(JwtAuthGuard, RolesGuard)
  @RolesDecorator(Role.ADMIN)
  @HttpCode(200)
  @Delete(':id')
  async delete(@Param('id') id: string): Promise<void> {
    return this.rolesService.delete({ id: Number(id) });
  }
}
