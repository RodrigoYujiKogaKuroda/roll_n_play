import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  //create system
  let system = await prisma.system.findFirst();
  if (system) await prisma.system.deleteMany();
  system = await prisma.system.create({
    data: {
      name: 'Dungeons & Dragons 5th Edition',
      logo_url: 'http://drive.google.com/uc?id=1V88pjxyCrPAm3AsBn70H_Pjf1c1ADJcm',
    },
  });

  //create attributes
  const attribute = await prisma.dnd5eAttribute.findFirst();
  if (attribute) await prisma.dnd5eAttribute.deleteMany();
  const strength = await prisma.dnd5eAttribute.create({
    data: {
      name: 'Strength',
      system_id: system.id,
    },
  });
  const dexterity = await prisma.dnd5eAttribute.create({
    data: {
      name: 'Dexterity',
      system_id: system.id,
    },
  });
  const constitution = await prisma.dnd5eAttribute.create({
    data: {
      name: 'Constitution',
      system_id: system.id,
    },
  });
  const intelligence = await prisma.dnd5eAttribute.create({
    data: {
      name: 'Intelligence',
      system_id: system.id,
    },
  });
  const wisdom = await prisma.dnd5eAttribute.create({
    data: {
      name: 'Wisdom',
      system_id: system.id,
    },
  });
  const charisma = await prisma.dnd5eAttribute.create({
    data: {
      name: 'Charisma',
      system_id: system.id,
    },
  });

  //create skills based on the attribute
  const skill = await prisma.dnd5eSkill.findFirst();
  if (skill) await prisma.dnd5eSkill.deleteMany();
  const acrobatics = await prisma.dnd5eSkill.create({
    data: {
      name: 'Acrobatics',
      attribute_id: dexterity.id,
    },
  });
  const animalHandling = await prisma.dnd5eSkill.create({
    data: {
      name: 'Animal Handling',
      attribute_id: wisdom.id,
    },
  });
  const arcana = await prisma.dnd5eSkill.create({
    data: {
      name: 'Arcana',
      attribute_id: intelligence.id,
    },
  });
  const athletics = await prisma.dnd5eSkill.create({
    data: {
      name: 'Athletics',
      attribute_id: strength.id,
    },
  });
  const deception = await prisma.dnd5eSkill.create({
    data: {
      name: 'Deception',
      attribute_id: charisma.id,
    },
  });
  const history = await prisma.dnd5eSkill.create({
    data: {
      name: 'History',
      attribute_id: intelligence.id,
    },
  });
  const insight = await prisma.dnd5eSkill.create({
    data: {
      name: 'Insight',
      attribute_id: wisdom.id,
    },
  });
  const intimidation = await prisma.dnd5eSkill.create({
    data: {
      name: 'Intimidation',
      attribute_id: charisma.id,
    },
  });
  const investigation = await prisma.dnd5eSkill.create({
    data: {
      name: 'Investigation',
      attribute_id: intelligence.id,
    },
  });
  const medicine = await prisma.dnd5eSkill.create({
    data: {
      name: 'Medicine',
      attribute_id: intelligence.id,
    },
  });
  const nature = await prisma.dnd5eSkill.create({
    data: {
      name: 'Nature',
      attribute_id: intelligence.id,
    },
  });
  const perception = await prisma.dnd5eSkill.create({
    data: {
      name: 'Perception',
      attribute_id: wisdom.id,
    },
  });
  const performance = await prisma.dnd5eSkill.create({
    data: {
      name: 'Performance',
      attribute_id: charisma.id,
    },
  });
  const persuasion = await prisma.dnd5eSkill.create({
    data: {
      name: 'Persuasion',
      attribute_id: charisma.id,
    },
  });
  const religion = await prisma.dnd5eSkill.create({
    data: {
      name: 'Religion',
      attribute_id: intelligence.id,
    },
  });
  const sleightOfHand = await prisma.dnd5eSkill.create({
    data: {
      name: 'Sleight of Hand',
      attribute_id: dexterity.id,
    },
  });
  const stealth = await prisma.dnd5eSkill.create({
    data: {
      name: 'Stealth',
      attribute_id: dexterity.id,
    },
  });
  const survival = await prisma.dnd5eSkill.create({
    data: {
      name: 'Survival',
      attribute_id: wisdom.id,
    },
  });

  //create races (only Human for now)
  const race = await prisma.dnd5eRace.findFirst();
  if (race) {
    await prisma.dnd5eRace.deleteMany();
    await prisma.dnd5eRacialTrait.deleteMany();
  }
  const human = await prisma.dnd5eRace.create({
    data: {
      name: 'Human',
      description:
        'In the reckonings of most worlds, humans are the youngest of the common races, late to arrive on the world scene and short-lived in comparison to dwarves, elves, and dragons. Perhaps it is because of their shorter lives that they strive to achieve as much as they can in the years they are given. Or maybe they feel they have something to prove to the elder races, and that’s why they build their mighty empires on the foundation of conquest and trade. Whatever drives them, humans are the innovators, the achievers, and the pioneers of the worlds.',
      system_id: system.id,
    },
  });
  const racialTraits = await prisma.dnd5eRacialTrait.createMany({
    data: [
      { name: 'Ability Score Increase', description: 'Your ability scores each increase by 1.', race_id: human.id },
      {
        name: 'Age',
        description: 'Humans reach adulthood in their late teens and live less than a century.',
        race_id: human.id,
      },
      {
        name: 'Alignment',
        description: 'Humans tend toward no particular alignment. The best and the worst are found among them.',
        race_id: human.id,
      },
      {
        name: 'Size',
        description:
          'Humans vary widely in height and build, from barely 5 feet to well over 6 feet tall. Regardless of your position in that range, your size is Medium.',
        race_id: human.id,
      },
      { name: 'Speed', description: 'Your base walking speed is 30 feet.', race_id: human.id },
      {
        name: 'Languages',
        description:
          'You can speak, read, and write Common and one extra language of your choice. Humans typically learn the languages of other peoples they deal with, including obscure dialects. They are fond of sprinkling their speech with words borrowed from other tongues: Orc curses, Elvish musical expressions, Dwarvish military phrases, and so on.',
        race_id: human.id,
      },
    ],
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
