class Character {
  name: string;
  health: number;
  attackPower: number;

  constructor(name: string, health: number, attackPower: number) {
    this.name = name;
    this.health = health;
    this.attackPower = attackPower;
  }

  attack(target: Character): void {
    console.log(`${this.name} attacks!`);
    target.takeDamage(this.attackPower);
  }

  takeDamage(amount: number): void {
    this.health -= amount;
    if (this.health < 0) this.health = 0;
  }

  isAlive(): boolean {
    return this.health > 0;
  }

  displayHealth(): void {
    console.log(`${this.name}'s health is now ${this.health}`);
  }
}

function exercise2(): void {
  console.log('A Monster appears!');

  const hero = new Character('Hero', 100, 15);
  const monster = new Character('Monster', 80, 10);

  console.log(`Hero (HP: ${hero.health}) vs. Monster (HP: ${monster.health})`);
  console.log('----------------------------------------------------');

  while (hero.isAlive() && monster.isAlive()) {
    hero.attack(monster);
    if (!monster.isAlive()) {
      console.log('Monster has been defeated!');
      console.log('Hero wins!');
      break;
    }
    monster.displayHealth();
    console.log('----------------------------------------------------');

    monster.attack(hero);
    if (!hero.isAlive()) {
      console.log('Hero has been defeated!');
      console.log('Monster wins!');
      break;
    }
    hero.displayHealth();
    console.log('----------------------------------------------------');
  }

  console.log('Game Over.');
}

exercise2();
