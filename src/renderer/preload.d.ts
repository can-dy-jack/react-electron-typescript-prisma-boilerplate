type Test = import('@prisma/client').Test;

declare global {
  interface Window {
    apis: {
      getList: () => Promise<Test[]>;
    };
  }
}

export {};
