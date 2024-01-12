-- AlterTable
ALTER TABLE `admin` ADD COLUMN `isVerified` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `verificationCode` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `student` ADD COLUMN `isVerified` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `verificationCode` VARCHAR(191) NULL;
