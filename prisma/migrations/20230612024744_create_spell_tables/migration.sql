-- CreateTable
CREATE TABLE "dnd5e_spell_schools" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_spell_schools_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dnd5e_spells" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "ritual" BOOLEAN NOT NULL DEFAULT false,
    "level" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "casting_time" VARCHAR(255) NOT NULL,
    "range" VARCHAR(255) NOT NULL,
    "components" VARCHAR(255) NOT NULL,
    "duration" VARCHAR(255) NOT NULL,
    "concentration" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT NOT NULL,
    "at_higher_levels" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_spells_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_spell_schools_name_key" ON "dnd5e_spell_schools"("name");

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_spells_name_key" ON "dnd5e_spells"("name");

-- AddForeignKey
ALTER TABLE "dnd5e_spells" ADD CONSTRAINT "dnd5e_spells_school_id_fkey" FOREIGN KEY ("school_id") REFERENCES "dnd5e_spell_schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
