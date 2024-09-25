import { Rover } from "./sprint1";

describe('Rover Initialization', () => {
  it('Returns the Rover position', () => {
    const rover = new Rover(0,0,'N');
    expect(rover.position()).toEqual([0,0]);
  });

  it('Returns the Rover position', () => {
    const rover = new Rover(1,0,'N');
    expect(rover.position()).toEqual([1,0]);
  });
});

describe('Moving Rover forward', () => {
  it('Moves from (0,0) facing North to (0,1) when it steps forward', () => {
    const rover = new Rover(0,0,'N');
    rover.forward()
    expect(rover.position()).toEqual([0, 1]);
  });

  it('Moves from (0,0) facing East to (1,0) when it steps forward', () => {
    const rover = new Rover(0,0,'E');
    rover.forward()
    expect(rover.position()).toEqual([1, 0]);
  });

  it('Moves from (0,0) facing South to (0,-1) when it steps forward', () => {
    const rover = new Rover(0,0,'S');
    rover.forward()
    expect(rover.position()).toEqual([0, -1]);
  });

  it('Moves from (0,0) facing West to (-1,0) when it steps forward', () => {
    const rover = new Rover(0,0,'W');
    rover.forward()
    expect(rover.position()).toEqual([-1, 0]);
  });
})

describe('Moving Rover backward', () => {
  it('Moves from (0,0) facing North to (0,-1) when it steps forward', () => {
    const rover = new Rover(0,0,'N');
    rover.backward()
    expect(rover.position()).toEqual([0, -1]);
  });

  it('Moves from (0,0) facing East to (-1,0) when it steps forward', () => {
    const rover = new Rover(0,0,'E');
    rover.backward()
    expect(rover.position()).toEqual([-1, 0]);
  });

  it('Moves from (0,0) backwards South to (0, 1) when it steps forward', () => {
    const rover = new Rover(0,0,'S');
    rover.backward()
    expect(rover.position()).toEqual([0, 1]);
  });

  it('Moves from (0,0) backwards West to (1,0) when it steps forward', () => {
    const rover = new Rover(0,0,'W');
    rover.backward()
    expect(rover.position()).toEqual([1, 0]);
  });
})

describe('Rover#Run', () => {
  it('accepts commands and run them', () => {

  })
})