import { PrismaClient } from '@prisma/client';
import { ipcMain } from 'electron';

export default function InitApis(prisma: PrismaClient) {
  ipcMain.handle('getList', async () => {
    const total = await prisma.test.findMany();

    return total;
  });
}
