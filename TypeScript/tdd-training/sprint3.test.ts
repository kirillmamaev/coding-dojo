import { Rover } from './sprint3';

describe('Rover init', () => {
  it('Rover knows its position 1', () => {
    const rover = new Rover(0, 0, 'N');
    expect(rover.position).toEqual([0,0]);
  });

  it('Rover knows its position 2', () => {
    const rover = new Rover(2, -1, 'N');
    expect(rover.position).toEqual([2,-1]);
  });

  it('Rover knows its direction', () => {
    const rover = new Rover(0, 0, 'N');
    expect(rover.direction).toEqual('N');
  });
});

describe("Rover can turn", () => {

  it('Rover can turn left', () => {
    const rover = new Rover(0, 0, 'E');
    rover.turnLeft();
    expect(rover.direction).toEqual('N');
  });

  it('Rover can turn right', () => {
    const rover = new Rover(0, 0, 'S');
    rover.turnRight();
    expect(rover.direction).toEqual('W');
  });

})


describe("Rover can move", () => {

  it('Rover can move forward', () => {
    const rover = new Rover(1, 0, 'E');
    rover.moveForward();
    expect(rover.position).toEqual([2,0]);
  });

  it('Rover can move forward', () => {
    const rover = new Rover(0, 0, 'W');
    rover.moveForward();
    expect(rover.position).toEqual([-1,0]);
  });

  it('Rover can move forward', () => {
    const rover = new Rover(0, 0, 'N');
    rover.moveForward();
    expect(rover.position).toEqual([0,1]);
  });

  it('Rover can move backward', () => {
    const rover = new Rover(1, 1, 'E');
    rover.moveBackward();
    expect(rover.position).toEqual([0,1]);
  });

  it('Rover can move backward', () => {
    const rover = new Rover(1, 1, 'W');
    rover.moveBackward();
    expect(rover.position).toEqual([2,1]);
  });

  it('Rover can move backward', () => {
    const rover = new Rover(0, 0, 'S');
    rover.moveBackward();
    expect(rover.position).toEqual([0,1]);
  });

})