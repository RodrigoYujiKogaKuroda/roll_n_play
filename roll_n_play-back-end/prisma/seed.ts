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

  //create class (only Fighter for now, until 5th level)
  const characterClass = await prisma.dnd5eClass.findFirst();
  if (characterClass) {
    await prisma.dnd5eClass.deleteMany();
    await prisma.dnd5eClassFeature.deleteMany();
  }
  const fighter = await prisma.dnd5eClass.create({
    data: {
      name: 'Fighter',
      description:
        'A human in clanging plate armor holds her shield before her as she runs toward the massed goblins. An elf behind her, clad in studded leather armor, peppers the goblins with arrows loosed from his exquisite bow. The half-orc nearby shouts orders, helping the two combatants coordinate their assault to the best advantage.<br>&nbsp;&nbsp;&nbsp;&nbsp;A dwarf in chain mail interposes his shield between the ogre’s club and his companion, knocking the deadly blow aside. His companion, a half-elf in scale armor, swings two scimitars in a blinding whirl as she circles the ogre, looking for a blind spot in its defenses.<br>&nbsp;&nbsp;&nbsp;&nbsp;A gladiator fights for sport in an arena, a master with his trident and net, skilled at toppling foes and moving them around for the crowd’s delight—and his own tactical advantage. His opponent’s sword flares with blue light an instant before she sends lightning flashing forth to smite him.<br>&nbsp;&nbsp;&nbsp;&nbsp;All of these heroes are fighters, perhaps the most diverse class of characters in the worlds of Dungeons & Dragons. Questing knights, conquering overlords, royal champions, elite foot soldiers, hardened mercenaries, and bandit kings—as fighters, they all share an unparalleled mastery with weapons and armor, and a thorough knowledge of the skills of combat. And they are well acquainted with death, both meting it out and staring it defiantly in the face.',
      system_id: system.id,
      hit_dice: 10,
    },
  });
  const fighterFeatures = await prisma.dnd5eClassFeature.createMany({
    data: [
      {
        name: 'Fighting Style',
        description:
          'You adopt a particular style of fighting as your specialty. Choose one of the following options. You can’t take a Fighting Style option more than once, even if you later get to choose again.<br><h2>Archery</h2>You gain a +2 bonus to attack rolls you make with ranged weapons.<br><h2>Defense</h2>While you are wearing armor, you gain a +1 bonus to AC.<br><h2>Dueling</h2>When you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon.<br><h2>Great Weapon Fighting</h2>When you roll a 1 or 2 on a damage die for an attack you make with a melee weapon that you are wielding with two hands, you can reroll the die and must use the new roll, even if the new roll is a 1 or a 2. The weapon must have the two-handed or versatile property for you to gain this benefit.<br><h2>Protection</h2>When a creature you can see attacks a target other than you that is within 5 feet of you, you can use your reaction to impose disadvantage on the attack roll. You must be wielding a shield.<br><h2>Two-Weapon Fighting</h2>When you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack.<br>',
        level: 1,
        class_id: fighter.id,
      },
      {
        name: 'Second Wind',
        description:
          'You have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level.<br>&nbsp;&nbsp;&nbsp;&nbsp;Once you use this feature, you must finish a short or long rest before you can use it again.',
        level: 1,
        class_id: fighter.id,
      },
      {
        name: 'Action Surge',
        description:
          'Starting at 2nd level, you can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action.<br>&nbsp;&nbsp;&nbsp;&nbsp;Once you use this feature, you must finish a short or long rest before you can use it again. Starting at 17th level, you can use it twice before a rest, but only once on the same turn.',
        level: 2,
        class_id: fighter.id,
      },
      {
        name: 'Martial Archetype',
        description:
          'At 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques. The Champion archetype is detailed at the end of the class description; see the Player’s Handbook for information on other martial archetypes. Your archetype grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level.',
        level: 3,
        class_id: fighter.id,
      },
      {
        name: 'Ability Score Improvement',
        description:
          'When you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can’t increase an ability score above 20 using this feature.',
        level: 4,
        class_id: fighter.id,
      },
      {
        name: 'Extra Attack',
        description:
          'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.<br>&nbsp;&nbsp;&nbsp;&nbsp;The number of attacks increases to three when you reach 11th level in this class and to four when you reach 20th level in this class.',
        level: 5,
        class_id: fighter.id,
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
