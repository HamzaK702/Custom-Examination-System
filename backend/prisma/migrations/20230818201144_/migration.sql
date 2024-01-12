/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `Tribe` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Tribe_name_key` ON `Tribe`(`name`);
