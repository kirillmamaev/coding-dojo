function exercise1(): void {
  console.log('A Monster appears!');

  let heroHP = 100;
  let heroAttack = 15;
  let monsterHP = 80;
  let monsterAttack = 10;

  console.log(`Hero (HP: ${heroHP}) vs. Monster (HP: ${monsterHP})`);
  console.log('----------------------------------------------------');

  while (heroHP > 0 && monsterHP > 0) {
    console.log('Hero attacks!');
    monsterHP -= heroAttack;
    if (monsterHP <= 0) {
      console.log('Monster has been defeated!');
      console.log('Hero wins!');
      break;
    }
    console.log(`Monster's health is now ${monsterHP}`);
    console.log('----------------------------------------------------');

    console.log('Monster attacks!');
    heroHP -= monsterAttack;
    if (heroHP <= 0) {
      console.log('Hero has been defeated!');
      console.log('Monster wins!');
      break;
    }
    console.log(`Hero's health is now ${heroHP}`);
    console.log('----------------------------------------------------');
  }

  console.log('Game Over.');
}

exercise1();
