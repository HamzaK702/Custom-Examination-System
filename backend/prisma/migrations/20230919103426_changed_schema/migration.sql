/*
  Warnings:

  - You are about to alter the column `type` on the `vocab` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(1))`.

*/
-- AlterTable
ALTER TABLE `vocab` MODIFY `type` ENUM('Basic', 'Intermediate', 'Advanced') NOT NULL DEFAULT 'Basic';

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `currentWordLevel` INTEGER NOT NULL DEFAULT 1,
    `currentWordType` ENUM('Basic', 'Intermediate', 'Advanced') NOT NULL DEFAULT 'Basic',

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_correctAttempts` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_correctAttempts_AB_unique`(`A`, `B`),
    INDEX `_correctAttempts_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_correctAttempts` ADD CONSTRAINT `_correctAttempts_A_fkey` FOREIGN KEY (`A`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_correctAttempts` ADD CONSTRAINT `_correctAttempts_B_fkey` FOREIGN KEY (`B`) REFERENCES `Vocab`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
