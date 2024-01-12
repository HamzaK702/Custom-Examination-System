/*
  Warnings:

  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `student_id` on the `student` table. All the data in the column will be lost.
  - The primary key for the `teacher` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `teacher_id` on the `teacher` table. All the data in the column will be lost.
  - The primary key for the `tribe` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `tribe_id` on the `tribe` table. All the data in the column will be lost.
  - Added the required column `id` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Teacher` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Tribe` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `student` DROP PRIMARY KEY,
    DROP COLUMN `student_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `teacher` DROP PRIMARY KEY,
    DROP COLUMN `teacher_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `tribe` DROP PRIMARY KEY,
    DROP COLUMN `tribe_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);
