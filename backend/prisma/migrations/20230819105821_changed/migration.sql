/*
  Warnings:

  - You are about to drop the column `tribe_name` on the `tribe` table. All the data in the column will be lost.
  - Added the required column `name` to the `Tribe` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `tribe` DROP COLUMN `tribe_name`,
    ADD COLUMN `name` VARCHAR(191) NOT NULL;
