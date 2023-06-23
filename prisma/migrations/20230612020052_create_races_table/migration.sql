-- CreateTable
CREATE TABLE "dnd5e_races" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "systemId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_races_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dnd5e_racial_traits" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "raceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_racial_traits_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_races_name_key" ON "dnd5e_races"("name");

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_racial_traits_name_key" ON "dnd5e_racial_traits"("name");

-- AddForeignKey
ALTER TABLE "dnd5e_races" ADD CONSTRAINT "dnd5e_races_systemId_fkey" FOREIGN KEY ("systemId") REFERENCES "systems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_racial_traits" ADD CONSTRAINT "dnd5e_racial_traits_raceId_fkey" FOREIGN KEY ("raceId") REFERENCES "dnd5e_races"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
