/*
  Warnings:

  - You are about to drop the column `tribeId` on the `parent` table. All the data in the column will be lost.
  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `tribeId` on the `student` table. All the data in the column will be lost.
  - The primary key for the `teacher` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `teacher` table. All the data in the column will be lost.
  - You are about to drop the column `tribeId` on the `teacher` table. All the data in the column will be lost.
  - The primary key for the `tribe` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `tribe` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `tribe` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `tribe` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `tribe` table. All the data in the column will be lost.
  - Added the required column `student_id` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teacher_id` to the `Teacher` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tribe_id` to the `Tribe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tribe_name` to the `Tribe` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `parent` DROP FOREIGN KEY `parent_tribeId_fkey`;

-- DropForeignKey
ALTER TABLE `student` DROP FOREIGN KEY `student_tribeId_fkey`;

-- DropForeignKey
ALTER TABLE `teacher` DROP FOREIGN KEY `teacher_tribeId_fkey`;

-- DropIndex
DROP INDEX `Tribe_name_key` ON `tribe`;

-- AlterTable
ALTER TABLE `parent` DROP COLUMN `tribeId`;

-- AlterTable
ALTER TABLE `student` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `tribeId`,
    ADD COLUMN `student_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`student_id`);

-- AlterTable
ALTER TABLE `teacher` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `tribeId`,
    ADD COLUMN `teacher_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`teacher_id`);

-- AlterTable
ALTER TABLE `tribe` DROP PRIMARY KEY,
    DROP COLUMN `createdAt`,
    DROP COLUMN `description`,
    DROP COLUMN `id`,
    DROP COLUMN `name`,
    ADD COLUMN `students` JSON NULL,
    ADD COLUMN `teachers` JSON NULL,
    ADD COLUMN `tribe_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `tribe_name` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`tribe_id`);

-- RenameIndex
ALTER TABLE `student` RENAME INDEX `student_email_key` TO `Student_email_key`;

-- RenameIndex
ALTER TABLE `teacher` RENAME INDEX `teacher_email_key` TO `Teacher_email_key`;
