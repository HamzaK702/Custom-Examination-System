/*
  Warnings:

  - You are about to drop the column `students` on the `tribe` table. All the data in the column will be lost.
  - You are about to drop the column `teachers` on the `tribe` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `student` ADD COLUMN `tribeId` INTEGER NULL;

-- AlterTable
ALTER TABLE `tribe` DROP COLUMN `students`,
    DROP COLUMN `teachers`;

-- AddForeignKey
ALTER TABLE `student` ADD CONSTRAINT `student_tribeId_fkey` FOREIGN KEY (`tribeId`) REFERENCES `Tribe`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
