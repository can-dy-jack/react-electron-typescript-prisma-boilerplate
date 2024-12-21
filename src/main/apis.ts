import { PrismaClient } from '@prisma/client';
import { ipcMain } from 'electron';

export default function InitApis(prisma: PrismaClient) {
  ipcMain.handle(
    'getCharacters',
    async (e) => { }
  );
}
