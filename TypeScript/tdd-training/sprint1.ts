export class Rover {
  private ROVER_MOVES = {
    "N": {
      "F": [0, 1],
      "B": [0,-1]
    }
  } as const;

  constructor(private _x: number, private _y: number, private _facing: string) {
  }

  position() {
    return [this._x, this._y]
  }

  forward() {
    if (this._facing === "N") this._y +=1
    if (this._facing === "S") this._y -=1 
    if (this._facing === "E") this._x +=1 
    if (this._facing === "W") this._x -=1 
  }

  backward() {
    if (this._facing === "N") this._y -=1
    if (this._facing === "S") this._y +=1 
    if (this._facing === "E") this._x -=1 
    if (this._facing === "W") this._x +=1 
  }
  
}
