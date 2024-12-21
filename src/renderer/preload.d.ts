type Character = import('@prisma/client').Character;
type Group = import('@prisma/client').Group;
type GroupRelation = import('@prisma/client').GroupRelation;

type GroupRelationInfo = GroupRelation & {
  group: Group;
};
type CharacterInfo = Character & {
  groups: GroupRelationInfo[];
};

declare global {
  interface Window {
    apis: {
      getCharacters: (
        searchParams: any,
      ) => Promise<{ total: number; data: CharacterInfo[] }>;
    };
  }
}

export {};
