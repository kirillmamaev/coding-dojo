## Exercise 1: The "Big Ball of Mud" 🏗️

### Your Mission
Create a simple turn-based combat game between a Hero and a Monster.

### Game Requirements
- Hero starts with 100 HP and 15 attack power
- Monster starts with 80 HP and 10 attack power
- Turn-based combat: Hero attacks first, then Monster
- Display health after each attack
- Game ends when one character reaches 0 or below HP
- Announce the winner

### Implementation Guidelines
- Write everything in **one single file**
- Use whatever approach gets you to a working game fastest
- Variables, loops, if statements - anything goes!
- No classes, no functions (except maybe a main function) - just get it working!

## Expected output
```
A Monster appears!
Hero (HP: 100) vs. Monster (HP: 80)
----------------------------------------------------
Hero attacks!
Monster's health is now 65
----------------------------------------------------
Monster attacks!
Hero's health is now 90
----------------------------------------------------
Hero attacks!
Monster's health is now 50
----------------------------------------------------
Monster attacks!
Hero's health is now 80
----------------------------------------------------
Hero attacks!
Monster's health is now 35
----------------------------------------------------
Monster attacks!
Hero's health is now 70
----------------------------------------------------
Hero attacks!
Monster's health is now 20
----------------------------------------------------
Monster attacks!
Hero's health is now 60
----------------------------------------------------
Hero attacks!
Monster's health is now 5
----------------------------------------------------
Monster attacks!
Hero's health is now 50
----------------------------------------------------
Hero attacks!
Monster has been defeated!
Hero wins!
Game Over.
```

**Time limit: 40 minutes** ⏰
**Run your code when you're done to make sure it works!**

### Tips
You'll do a couple of things in this exercise that you (hopefully) don't do in your day to day.
Here are a couple of snippets that will help.

#### Ruby
```ruby
### in example.rb
  def foo
    puts "bar"
  end

### in example_spec.rb

require 'rspec'
require_relative 'example'

RSpec.describe "#foo" do
  it 'outputs "bar"' do
    expect { foo }.to output("bar\n").to_stdout
  end
end
```

#### TypeScript
```typescript
### in example.ts
export function foo(): void {
  console.log("bar");
}

foo();

### in example.test.ts
import { foo } from "./example";

describe("foo", () => {
  it("outputs \"bar\"", () => {
    const consoleSpy = jest.spyOn(console, "log").mockImplementation();
    foo();
    expect(consoleSpy).toHaveBeenCalledWith("bar");
    consoleSpy.mockRestore();
  });
});
```
