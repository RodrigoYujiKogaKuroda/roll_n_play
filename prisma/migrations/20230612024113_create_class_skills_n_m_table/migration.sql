/*
  Warnings:

  - You are about to drop the `attributes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `skills` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "skills" DROP CONSTRAINT "skills_attribute_id_fkey";

-- DropTable
DROP TABLE "attributes";

-- DropTable
DROP TABLE "skills";

-- CreateTable
CREATE TABLE "dnd5e_attributes" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_attributes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dnd5e_skills" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "attribute_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Dnd5eClassToDnd5eSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_attributes_name_key" ON "dnd5e_attributes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_skills_name_key" ON "dnd5e_skills"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_Dnd5eClassToDnd5eSkill_AB_unique" ON "_Dnd5eClassToDnd5eSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_Dnd5eClassToDnd5eSkill_B_index" ON "_Dnd5eClassToDnd5eSkill"("B");

-- AddForeignKey
ALTER TABLE "dnd5e_skills" ADD CONSTRAINT "dnd5e_skills_attribute_id_fkey" FOREIGN KEY ("attribute_id") REFERENCES "dnd5e_attributes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Dnd5eClassToDnd5eSkill" ADD CONSTRAINT "_Dnd5eClassToDnd5eSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "dnd5e_classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Dnd5eClassToDnd5eSkill" ADD CONSTRAINT "_Dnd5eClassToDnd5eSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "dnd5e_skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;
