// const { contextBridge, ipcRenderer } = require('electron');
import { contextBridge, ipcRenderer } from 'electron';

contextBridge.exposeInMainWorld('apis', {
  getList: () => ipcRenderer.invoke('getList'),
});
