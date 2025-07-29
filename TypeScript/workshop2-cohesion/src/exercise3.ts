class DamageCalculator {
  static calculateDamage(baseAttack: number): number {
    return baseAttack;
  }
}

class GameCharacter {
  name: string;
  health: number;
  attackPower: number;

  constructor(name: string, health: number, attackPower: number) {
    this.name = name;
    this.health = health;
    this.attackPower = attackPower;
  }

  attack(target: GameCharacter): void {
    console.log(`${this.name} attacks!`);
    const damage = DamageCalculator.calculateDamage(this.attackPower);
    target.takeDamage(damage);
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

class Battle {
  private hero: GameCharacter;
  private monster: GameCharacter;

  constructor(hero: GameCharacter, monster: GameCharacter) {
    this.hero = hero;
    this.monster = monster;
  }

  start(): void {
    console.log('A Monster appears!');
    console.log(`Hero (HP: ${this.hero.health}) vs. Monster (HP: ${this.monster.health})`);
    console.log('----------------------------------------------------');

    while (this.hero.isAlive() && this.monster.isAlive()) {
      this.hero.attack(this.monster);
      if (!this.monster.isAlive()) {
        console.log('Monster has been defeated!');
        console.log('Hero wins!');
        break;
      }
      this.monster.displayHealth();
      console.log('----------------------------------------------------');

      this.monster.attack(this.hero);
      if (!this.hero.isAlive()) {
        console.log('Hero has been defeated!');
        console.log('Monster wins!');
        break;
      }
      this.hero.displayHealth();
      console.log('----------------------------------------------------');
    }

    console.log('Game Over.');
  }
}

function exercise3(): void {
  const hero = new GameCharacter('Hero', 100, 15);
  const monster = new GameCharacter('Monster', 80, 10);
  const battle = new Battle(hero, monster);
  battle.start();
}

exercise3();
