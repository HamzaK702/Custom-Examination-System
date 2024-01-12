-- AlterTable
ALTER TABLE `teacher` ADD COLUMN `isVerified` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `verificationCode` VARCHAR(191) NULL;
