export class Rover {

  get direction(): string  {
    return this._direction;
  }

  set direction(direction: string) {
    this._direction = direction
  }

  get position(): number[] {
    return [this._x, this._y]
  }

  set position(position: number[]) {
    this._x = position[0];
    this._y = position[1];
  }

  constructor(private _x: number, private _y: number, private _direction: string) {}

  run(commands: string[]): void {
    for(let command of commands) {
      if (command === "F") {
        this.position = forward(this.position, this.direction);
      };

      if (command === "B") {
        this.position = backward(this.position, this.direction);
      };

      if (command === "R") {
        this.direction = turn("R", this.direction);
      };

      if (command === "L") {
        this.direction = turn("L", this.direction);
      };
    }
  }
}


const moves: Record<string, number[]> = {
  "N": [0, 1],
  "E": [1, 0],
  "S": [0, -1],
  "W": [-1, 0]
}

const turns: Record<string, Record<string, string>> = {
  "R": {
    "N": "E",
    "E": "S",
    "S": "W",
    "W": "N"
  },
  "L": {
    "N": "W",
    "E": "N",
    "S": "E",
    "W": "S"
  }
}

export function forward(position: number[], direction: string): number[] {
  return [position[0] + moves[direction][0], position[1] + moves[direction][1]]
};

export function backward(position: number[], direction: string): number[] {
  return [position[0] + (-1 * moves[direction][0]), position[1] + (-1 * moves[direction][1])];
};

export function turn(command: string, direction: string): string {
  return turns[command][direction]

}
