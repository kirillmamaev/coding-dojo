## Exercise 2: Communicational Cohesion 🎯

### Your Mission
Refactor your "big ball of mud" code by grouping **data with the operations that use that data**.

### Key Concept: Communicational Cohesion
> **"Group code that operates on the same data"**
> 
> Put health, attack power, and methods like `take_damage()` and `is_alive()` together in the same class or structure.

### Refactoring Guidelines

1. **Create a Character class/structure** that contains:
   - Properties: `name`, `health`, `attack_power`
   - Methods: `attack()`, `take_damage()`, `is_alive()`

2. **Move related logic together**:
   - Health management stays with the Character
   - Attack logic stays with the Character
   - Display logic can be in the methods

3. **Keep the same game flow** but use your new structure

### What Should Improve
- ✅ Clearer separation of character-specific logic
- ✅ Easier to understand what each part does
- ✅ Better foundation for adding features
- ✅ More testable individual components

**Time limit: 30 minutes** ⏰