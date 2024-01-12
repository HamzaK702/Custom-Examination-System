/*
  Warnings:

  - You are about to drop the column `country` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `isVerified` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `verificationCode` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the `course` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `event` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `file` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `parent` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `student` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `teacher` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tribe` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `file` DROP FOREIGN KEY `File_courseId_fkey`;

-- DropForeignKey
ALTER TABLE `student` DROP FOREIGN KEY `student_tribeId_fkey`;

-- DropForeignKey
ALTER TABLE `teacher` DROP FOREIGN KEY `teacher_courseId_fkey`;

-- DropForeignKey
ALTER TABLE `teacher` DROP FOREIGN KEY `teacher_tribeId_fkey`;

-- AlterTable
ALTER TABLE `admin` DROP COLUMN `country`,
    DROP COLUMN `isVerified`,
    DROP COLUMN `verificationCode`;

-- DropTable
DROP TABLE `course`;

-- DropTable
DROP TABLE `event`;

-- DropTable
DROP TABLE `file`;

-- DropTable
DROP TABLE `parent`;

-- DropTable
DROP TABLE `student`;

-- DropTable
DROP TABLE `teacher`;

-- DropTable
DROP TABLE `tribe`;
