/*
  Warnings:

  - Added the required column `system_id` to the `dnd5e_attributes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "dnd5e_attributes" ADD COLUMN     "system_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "dnd5e_attributes" ADD CONSTRAINT "dnd5e_attributes_system_id_fkey" FOREIGN KEY ("system_id") REFERENCES "systems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
