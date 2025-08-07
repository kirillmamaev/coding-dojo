## Exercise 3: Sequential Cohesion 🚀

### Your Mission
Take your refactoring further by applying **Sequential** cohesion principles.

### Key Concepts

**Sequential Cohesion:**
> **"Group code that follows a sequence of steps"**
> 
> The game loop is a sequence: setup → take turns → check winner → end game

### Advanced Refactoring Guidelines

1. **Create a Battle class** (Sequential Cohesion):
   - Manages the flow of the entire game
   - Handles turn sequence
   - Determines when game ends
   - Announces winner

2. **Organize your code into distinct layers**:
   - **Character**: Data + operations on that data
   - **Battle**: Game flow and turn management

### Architecture Goal
```
Character (Communicational)
     ↓
Battle (Sequential)
     ↓
Game Execution
```


**Time limit: 30 minutes** ⏰
