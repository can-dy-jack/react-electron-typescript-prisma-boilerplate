-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_groups" (
    "group_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_name" TEXT NOT NULL,
    "group_desc" TEXT,
    "parent_group_id" INTEGER,
    CONSTRAINT "groups_parent_group_id_fkey" FOREIGN KEY ("parent_group_id") REFERENCES "groups" ("group_id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_groups" ("group_desc", "group_id", "group_name", "parent_group_id") SELECT "group_desc", "group_id", "group_name", "parent_group_id" FROM "groups";
DROP TABLE "groups";
ALTER TABLE "new_groups" RENAME TO "groups";
CREATE UNIQUE INDEX "groups_group_name_key" ON "groups"("group_name");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
