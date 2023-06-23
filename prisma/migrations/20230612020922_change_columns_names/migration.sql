/*
  Warnings:

  - You are about to drop the column `createdAt` on the `attributes` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `attributes` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `dnd5e_races` table. All the data in the column will be lost.
  - You are about to drop the column `systemId` on the `dnd5e_races` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `dnd5e_races` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `dnd5e_racial_traits` table. All the data in the column will be lost.
  - You are about to drop the column `raceId` on the `dnd5e_racial_traits` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `dnd5e_racial_traits` table. All the data in the column will be lost.
  - You are about to drop the column `attributeId` on the `skills` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `skills` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `skills` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `systems` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `systems` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `iamge_url` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `users` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `system_id` to the `dnd5e_races` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `dnd5e_races` table without a default value. This is not possible if the table is not empty.
  - Added the required column `race_id` to the `dnd5e_racial_traits` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `dnd5e_racial_traits` table without a default value. This is not possible if the table is not empty.
  - Added the required column `attribute_id` to the `skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `skills` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `systems` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "dnd5e_races" DROP CONSTRAINT "dnd5e_races_systemId_fkey";

-- DropForeignKey
ALTER TABLE "dnd5e_racial_traits" DROP CONSTRAINT "dnd5e_racial_traits_raceId_fkey";

-- DropForeignKey
ALTER TABLE "skills" DROP CONSTRAINT "skills_attributeId_fkey";

-- AlterTable
ALTER TABLE "attributes" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "dnd5e_races" DROP COLUMN "createdAt",
DROP COLUMN "systemId",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "system_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "dnd5e_racial_traits" DROP COLUMN "createdAt",
DROP COLUMN "raceId",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "race_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "skills" DROP COLUMN "attributeId",
DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "attribute_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "systems" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "createdAt",
DROP COLUMN "iamge_url",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "image_url" TEXT,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "skills" ADD CONSTRAINT "skills_attribute_id_fkey" FOREIGN KEY ("attribute_id") REFERENCES "attributes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_races" ADD CONSTRAINT "dnd5e_races_system_id_fkey" FOREIGN KEY ("system_id") REFERENCES "systems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_racial_traits" ADD CONSTRAINT "dnd5e_racial_traits_race_id_fkey" FOREIGN KEY ("race_id") REFERENCES "dnd5e_races"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
