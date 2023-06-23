-- CreateTable
CREATE TABLE "_Dnd5eClassToDnd5eSpell" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Dnd5eClassToDnd5eSpell_AB_unique" ON "_Dnd5eClassToDnd5eSpell"("A", "B");

-- CreateIndex
CREATE INDEX "_Dnd5eClassToDnd5eSpell_B_index" ON "_Dnd5eClassToDnd5eSpell"("B");

-- AddForeignKey
ALTER TABLE "_Dnd5eClassToDnd5eSpell" ADD CONSTRAINT "_Dnd5eClassToDnd5eSpell_A_fkey" FOREIGN KEY ("A") REFERENCES "dnd5e_classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Dnd5eClassToDnd5eSpell" ADD CONSTRAINT "_Dnd5eClassToDnd5eSpell_B_fkey" FOREIGN KEY ("B") REFERENCES "dnd5e_spells"("id") ON DELETE CASCADE ON UPDATE CASCADE;
