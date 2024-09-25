export class Rover {

  private leftTurns: Record<string, string> = {
    "N": "W",
    "E": "N",
    "S": "E",
    "W": "S"
  };

  private rightTurns: Record<string, string> = {
    "N": "E",
    "E": "S",
    "S": "W",
    "W": "N"
  };


  private moveForwards: Record<string, any> = {
    "N": this.moveNorth,
    "E": this.moveEast,
    "S": this.moveSouth,
    "W": this.moveWest
  };

  get direction(): string {
    return this._direction;
  }

  get position() {
    return [this.x, this.y]
  }

  constructor(private x: number, private y: number, private _direction: string) {}

  turnLeft() {
    this._direction = this.leftTurns[this._direction];
  }
  turnRight() {
    this._direction = this.rightTurns[this._direction];
  }

  moveForward() {
    this.moveForwards[this.direction]()
    // if(this.direction === "E") {
    //   this.moveEast();
    // } else if (this.direction ==="W") {
    //   this.moveWest();
    // } else if (this.direction ==="S") {
    //   this.moveSouth();
    // } else if (this.direction ==="N") {
    //   this.moveNorth();
    // }
  }

  moveNorth() {
    this.y += 1;
  }
  moveEast() {
    this.x += 1;
  }
  moveSouth() {
    this.y -= 1;
  }
  moveWest() {
    this.x -= 1;
  }


  moveBackward() {
    if(this.direction === "E" ){
      this.moveWest();
    } else if(this.direction === "W"){
      this.moveEast();
    } else if (this.direction ==="S") {
      this.moveNorth();
    } else if (this.direction ==="N") {
      this.moveSouth();
    }
  }
}
