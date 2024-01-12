-- AlterTable
ALTER TABLE `teacher` ADD COLUMN `tribeId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `teacher` ADD CONSTRAINT `teacher_tribeId_fkey` FOREIGN KEY (`tribeId`) REFERENCES `Tribe`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
