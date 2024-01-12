/*
  Warnings:

  - You are about to drop the column `correctOption` on the `vocab` table. All the data in the column will be lost.
  - You are about to drop the column `option1` on the `vocab` table. All the data in the column will be lost.
  - You are about to drop the column `option2` on the `vocab` table. All the data in the column will be lost.
  - Added the required column `correctMeaning` to the `Vocab` table without a default value. This is not possible if the table is not empty.
  - Added the required column `meanings` to the `Vocab` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sentence` to the `Vocab` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Vocab` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `vocab` DROP COLUMN `correctOption`,
    DROP COLUMN `option1`,
    DROP COLUMN `option2`,
    ADD COLUMN `correctMeaning` VARCHAR(191) NOT NULL,
    ADD COLUMN `locked` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `meanings` JSON NOT NULL,
    ADD COLUMN `sentence` VARCHAR(191) NOT NULL,
    ADD COLUMN `type` VARCHAR(191) NOT NULL;
