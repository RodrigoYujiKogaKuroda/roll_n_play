-- CreateTable
CREATE TABLE "dnd5e_subclasses" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "class_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_subclasses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dnd5e_subclass_features" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "subclass_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dnd5e_subclass_features_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_subclasses_name_key" ON "dnd5e_subclasses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "dnd5e_subclass_features_name_key" ON "dnd5e_subclass_features"("name");

-- AddForeignKey
ALTER TABLE "dnd5e_subclasses" ADD CONSTRAINT "dnd5e_subclasses_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "dnd5e_classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dnd5e_subclass_features" ADD CONSTRAINT "dnd5e_subclass_features_subclass_id_fkey" FOREIGN KEY ("subclass_id") REFERENCES "dnd5e_subclasses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
