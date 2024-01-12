-- AlterTable
ALTER TABLE `teacher` ADD COLUMN `courseId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `teacher` ADD CONSTRAINT `teacher_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
