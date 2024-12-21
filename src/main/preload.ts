// const { contextBridge, ipcRenderer } = require('electron');
import { contextBridge, ipcRenderer } from 'electron';
import { TableSearchParams } from './type';

contextBridge.exposeInMainWorld('apis', {
  getCharacters: (searchParams: TableSearchParams) =>
    ipcRenderer.invoke('getCharacters', searchParams),
});
