-- AlterTable
ALTER TABLE "dnd5e_characters" ALTER COLUMN "xp" SET DEFAULT 0,
ALTER COLUMN "level" SET DEFAULT 1;

-- CreateTable
CREATE TABLE "_Dnd5eAttributeToDnd5eCharacter" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Dnd5eAttributeToDnd5eCharacter_AB_unique" ON "_Dnd5eAttributeToDnd5eCharacter"("A", "B");

-- CreateIndex
CREATE INDEX "_Dnd5eAttributeToDnd5eCharacter_B_index" ON "_Dnd5eAttributeToDnd5eCharacter"("B");

-- AddForeignKey
ALTER TABLE "_Dnd5eAttributeToDnd5eCharacter" ADD CONSTRAINT "_Dnd5eAttributeToDnd5eCharacter_A_fkey" FOREIGN KEY ("A") REFERENCES "dnd5e_attributes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Dnd5eAttributeToDnd5eCharacter" ADD CONSTRAINT "_Dnd5eAttributeToDnd5eCharacter_B_fkey" FOREIGN KEY ("B") REFERENCES "dnd5e_characters"("id") ON DELETE CASCADE ON UPDATE CASCADE;
