-- CreateTable
CREATE TABLE "_Dnd5eCharacterToDnd5eSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Dnd5eCharacterToDnd5eSkill_AB_unique" ON "_Dnd5eCharacterToDnd5eSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_Dnd5eCharacterToDnd5eSkill_B_index" ON "_Dnd5eCharacterToDnd5eSkill"("B");

-- AddForeignKey
ALTER TABLE "_Dnd5eCharacterToDnd5eSkill" ADD CONSTRAINT "_Dnd5eCharacterToDnd5eSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "dnd5e_characters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Dnd5eCharacterToDnd5eSkill" ADD CONSTRAINT "_Dnd5eCharacterToDnd5eSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "dnd5e_skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;
