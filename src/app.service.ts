import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHealth() {
    return {
      status: 200,
      ok: true,
      env: process.env.NODE_ENV
    };
  }
}
