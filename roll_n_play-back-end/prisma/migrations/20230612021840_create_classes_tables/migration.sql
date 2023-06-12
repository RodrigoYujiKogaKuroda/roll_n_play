-- CreateTable
CREATE TABLE "dnd5e_classes" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "system_id" INTEGER NOT NULL,
    "hit_dice" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dnd5e_class_features" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "class_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_class_features_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_classes_name_key" ON "dnd5e_classes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_class_features_name_key" ON "dnd5e_class_features"("name");

-- AddForeignKey
ALTER TABLE "dnd5e_classes" ADD CONSTRAINT "dnd5e_classes_system_id_fkey" FOREIGN KEY ("system_id") REFERENCES "systems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_class_features" ADD CONSTRAINT "dnd5e_class_features_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "dnd5e_classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
