import { Rover, forward } from './sprint2';

describe('Rover init', () => {
  it('Rover knows its position', () => {
    const rover = new Rover(0, 0, 'N');
    expect(rover.position).toEqual([0,0]);
  });
  
  it('Rover knows its position', () => {
    const rover = new Rover(2, 1, 'N');
    expect(rover.position).toEqual([2,1]);
  });

  it("it's starting direction is north", () => {
    const rover = new Rover(0, 0, 'N');
    expect(rover.direction).toEqual("N")
  })
});

describe('Rover moves forward', () => {
  it('moves one step forward facing north', () => {
    const rover = new Rover(0,0,'N')
    rover.position = forward(rover.position, rover.direction);
    expect(rover.position).toEqual([0,1])
  })
})