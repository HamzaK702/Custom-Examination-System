-- CreateTable
CREATE TABLE `Course` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `videoPath` VARCHAR(191) NULL,
    `teacher` VARCHAR(191) NULL,
    `price` DOUBLE NULL,
    `quizzes` VARCHAR(191) NULL,
    `zoomLink` VARCHAR(191) NULL,
    `certificate` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Course_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
