## Exercise 3: Advanced Refactoring 🚀

### Your Mission
Take your refactoring further by applying **Sequential** and **Functional** cohesion principles.

### Key Concepts

**Sequential Cohesion:**
> **"Group code that follows a sequence of steps"**
> 
> The game loop is a sequence: setup → take turns → check winner → end game

**Functional Cohesion:**
> **"Create functions that do one thing well"**
> 
> Pure functions with no side effects, like calculating damage

### Advanced Refactoring Guidelines

1. **Create a Battle class** (Sequential Cohesion):
   - Manages the flow of the entire game
   - Handles turn sequence
   - Determines when game ends
   - Announces winner

2. **Create pure functions** (Functional Cohesion):
   - `calculateDamage(baseAttack)` - returns damage amount
   - Could expand with randomness, critical hits, etc.
   - No side effects - just input → output

3. **Organize your code into distinct layers**:
   - **Character**: Data + operations on that data
   - **Battle**: Game flow and turn management
   - **DamageCalculator**: Pure calculation functions

### Architecture Goal
```
DamageCalculator (Functional)
     ↓
Character (Communicational)
     ↓
Battle (Sequential)
     ↓
Game Execution
```

**Time limit: 30 minutes** ⏰