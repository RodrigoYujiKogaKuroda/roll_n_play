-- CreateTable
CREATE TABLE "dnd5e_characters" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "system_id" INTEGER NOT NULL,
    "xp" INTEGER NOT NULL,
    "level" INTEGER NOT NULL,
    "race_id" INTEGER NOT NULL,
    "class_id" INTEGER NOT NULL,
    "subclass_id" INTEGER NOT NULL,
    "max_hp" INTEGER NOT NULL,
    "ac" INTEGER NOT NULL,
    "speed" INTEGER NOT NULL,
    "inspiration" BOOLEAN NOT NULL DEFAULT false,
    "alignment" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_characters_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "dnd5e_characters" ADD CONSTRAINT "dnd5e_characters_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_characters" ADD CONSTRAINT "dnd5e_characters_system_id_fkey" FOREIGN KEY ("system_id") REFERENCES "systems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_characters" ADD CONSTRAINT "dnd5e_characters_race_id_fkey" FOREIGN KEY ("race_id") REFERENCES "dnd5e_races"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_characters" ADD CONSTRAINT "dnd5e_characters_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "dnd5e_classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_characters" ADD CONSTRAINT "dnd5e_characters_subclass_id_fkey" FOREIGN KEY ("subclass_id") REFERENCES "dnd5e_subclasses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
