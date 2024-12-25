-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_courses" (
    "course_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "course_name" TEXT NOT NULL,
    "course_desc" TEXT,
    "label" TEXT,
    "link" TEXT,
    "detail" TEXT,
    "isFinished" BOOLEAN
);
INSERT INTO "new_courses" ("course_desc", "course_id", "course_name", "detail", "isFinished", "label", "link") SELECT "course_desc", "course_id", "course_name", "detail", "isFinished", "label", "link" FROM "courses";
DROP TABLE "courses";
ALTER TABLE "new_courses" RENAME TO "courses";
CREATE UNIQUE INDEX "courses_course_name_key" ON "courses"("course_name");
CREATE TABLE "new_groups" (
    "group_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_name" TEXT NOT NULL,
    "group_desc" TEXT,
    "parent_group_id" INTEGER NOT NULL,
    CONSTRAINT "groups_parent_group_id_fkey" FOREIGN KEY ("parent_group_id") REFERENCES "groups" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_groups" ("group_desc", "group_id", "group_name", "parent_group_id") SELECT "group_desc", "group_id", "group_name", "parent_group_id" FROM "groups";
DROP TABLE "groups";
ALTER TABLE "new_groups" RENAME TO "groups";
CREATE UNIQUE INDEX "groups_group_name_key" ON "groups"("group_name");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
