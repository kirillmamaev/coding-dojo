function calculateDamage(baseAttack: number): number {
  return baseAttack;
}

class GameCharacter4 {
  name: string;
  health: number;
  attackPower: number;

  constructor(name: string, health: number, attackPower: number) {
    this.name = name;
    this.health = health;
    this.attackPower = attackPower;
  }

  takeDamage(amount: number): void {
    this.health -= amount;
    if (this.health < 0) this.health = 0;
  }

  isAlive(): boolean {
    return this.health > 0;
  }

  getAttackDamage(): number {
    return calculateDamage(this.attackPower);
  }

  displayHealth(): void {
    console.log(`${this.name}'s health is now ${this.health}`);
  }

  displayStatus(): string {
    return `${this.name} (HP: ${this.health})`;
  }
}

class Battle4 {
  private hero: GameCharacter4;
  private monster: GameCharacter4;

  constructor(hero: GameCharacter4, monster: GameCharacter4) {
    this.hero = hero;
    this.monster = monster;
  }

  start(): void {
    this.displayBattleStart();
    
    while (this.isBattleOngoing()) {
      this.executePlayerTurn();
      if (!this.isBattleOngoing()) break;
      
      this.executeMonsterTurn();
    }

    this.displayBattleEnd();
  }

  private displayBattleStart(): void {
    console.log('A Monster appears!');
    console.log(`${this.hero.displayStatus()} vs. ${this.monster.displayStatus()}`);
    console.log('----------------------------------------------------');
  }

  private isBattleOngoing(): boolean {
    return this.hero.isAlive() && this.monster.isAlive();
  }

  private executePlayerTurn(): void {
    this.performAttack(this.hero, this.monster, 'Hero');
  }

  private executeMonsterTurn(): void {
    if (this.monster.isAlive()) {
      this.performAttack(this.monster, this.hero, 'Monster');
    }
  }

  private performAttack(attacker: GameCharacter4, target: GameCharacter4, attackerType: string): void {
    console.log(`${attacker.name} attacks!`);
    const damage = attacker.getAttackDamage();
    target.takeDamage(damage);
    
    if (!target.isAlive()) {
      console.log(`${target.name} has been defeated!`);
      console.log(`${attackerType === 'Hero' ? 'Hero' : 'Monster'} wins!`);
    } else {
      target.displayHealth();
      console.log('----------------------------------------------------');
    }
  }

  private displayBattleEnd(): void {
    console.log('Game Over.');
  }
}

function exercise4(): void {
  const hero = new GameCharacter4('Hero', 100, 15);
  const monster = new GameCharacter4('Monster', 80, 10);
  const battle = new Battle4(hero, monster);
  battle.start();
}

exercise4();
