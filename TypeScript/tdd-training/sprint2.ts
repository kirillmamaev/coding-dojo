export class Rover {

  get direction() {
    return this._direction;
  }

  get position(): number[] {
    return [this.x, this.y]
  }

  set position(position: number[]) {
    this.x = position[0];
    this.y = position[1];
  }

  constructor(private x: number, private y: number, private _direction: string) {}
}

export function forward(position: number[], direction: string): number[] {
  if (direction == "N") position[1] += 1;
  return position;
}