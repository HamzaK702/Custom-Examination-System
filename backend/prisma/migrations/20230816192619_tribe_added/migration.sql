-- AlterTable
ALTER TABLE `parent` ADD COLUMN `tribeId` INTEGER NULL;

-- AlterTable
ALTER TABLE `student` ADD COLUMN `tribeId` INTEGER NULL;

-- AlterTable
ALTER TABLE `teacher` ADD COLUMN `tribeId` INTEGER NULL;

-- CreateTable
CREATE TABLE `Tribe` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `student` ADD CONSTRAINT `student_tribeId_fkey` FOREIGN KEY (`tribeId`) REFERENCES `Tribe`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `teacher` ADD CONSTRAINT `teacher_tribeId_fkey` FOREIGN KEY (`tribeId`) REFERENCES `Tribe`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `parent` ADD CONSTRAINT `parent_tribeId_fkey` FOREIGN KEY (`tribeId`) REFERENCES `Tribe`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
