/*
  Warnings:

  - You are about to drop the `Information` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Information";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "groups" (
    "group_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_name" TEXT NOT NULL,
    "group_desc" TEXT NOT NULL,
    "parent_group_id" INTEGER NOT NULL,
    CONSTRAINT "groups_parent_group_id_fkey" FOREIGN KEY ("parent_group_id") REFERENCES "groups" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "courses" (
    "course_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "course_name" TEXT NOT NULL,
    "course_desc" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "detail" TEXT NOT NULL,
    "isFinished" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "course_group_relations" (
    "relation_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "course_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "course_group_relations_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses" ("course_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "course_group_relations_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "groups" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "groups_group_name_key" ON "groups"("group_name");

-- CreateIndex
CREATE UNIQUE INDEX "courses_course_name_key" ON "courses"("course_name");
