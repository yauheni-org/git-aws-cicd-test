import {Controller, Get, HttpCode, HttpStatus} from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @HttpCode(HttpStatus.OK)
  @Get()
  healthcheck() {
    return this.appService.getHealth();
  }
}
