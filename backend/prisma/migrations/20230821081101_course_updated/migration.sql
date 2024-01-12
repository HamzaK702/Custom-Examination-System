/*
  Warnings:

  - You are about to drop the column `teacher` on the `course` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `course` DROP COLUMN `teacher`,
    ADD COLUMN `rating` DOUBLE NULL;
