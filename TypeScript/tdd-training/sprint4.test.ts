import { Rover, backward, forward, turn } from './sprint4';

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
  });

  it('moves one step forward facing south', () => {
    const rover = new Rover(2,3,'S')
    rover.position = forward(rover.position, rover.direction);
    expect(rover.position).toEqual([2,2])
  });

  it('moves one step forward facing east', () => {
    const rover = new Rover(0,0,'E')
    rover.position = forward(rover.position, rover.direction);
    expect(rover.position).toEqual([1,0])
  });

  it('moves one step forward facing west', () => {
    const rover = new Rover(0,0,'W')
    rover.position = forward(rover.position, rover.direction);
    expect(rover.position).toEqual([-1,0])
  })
});

describe('Rover moves backward', () => {
  it('moves one step backward facing north', () => {
    const rover = new Rover(0,0,'N')
    rover.position = backward(rover.position, rover.direction);
    expect(rover.position).toEqual([0,-1])
  });

  it('moves one step backward facing south', () => {
    const rover = new Rover(2,4,'S')
    rover.position = backward(rover.position, rover.direction);
    expect(rover.position).toEqual([2,5])
  });

  it('moves one step backward facing east', () => {
    const rover = new Rover(0,0,'E')
    rover.position = backward(rover.position, rover.direction);
    expect(rover.position).toEqual([-1,0])
  });

  it('moves one step backward facing west', () => {
    const rover = new Rover(0,0,'W')
    rover.position = backward(rover.position, rover.direction);
    expect(rover.position).toEqual([1,0])
  })
});

describe('Rover turns', () => {
  it('turning right faces east from north', () => {
    const rover = new Rover(0,0,'N')
    rover.direction = turn("R", rover.direction);
    expect(rover.direction).toEqual('E')
  });

  it('turning right faces south from east', () => {
    const rover = new Rover(0,0,'E')
    rover.direction = turn("R", rover.direction);
    expect(rover.direction).toEqual('S')
  });

  it('turning left faces west from north', () => {
    const rover = new Rover(0,0,'N')
    rover.direction = turn("L", rover.direction);
    expect(rover.direction).toEqual('W')
  });

  it('turning left faces north from east', () => {
    const rover = new Rover(0,0,'E')
    rover.direction = turn("L", rover.direction);
    expect(rover.direction).toEqual('N')
  });
});

describe('Rover executes commands', () => {
  it('takes one "F" in the array facing north', () => {
    const rover = new Rover(0,0,'N')
    rover.run(['F'])
    expect(rover.position).toEqual([0,1])
  });

  it('takes one "B" in the array facing north', () => {
    const rover = new Rover(0,0,'N')
    rover.run(['B'])
    expect(rover.position).toEqual([0, -1])
  });

  it('takes and execute the array of commands', () => {
    const rover = new Rover(0,0,'N')
    rover.run(['F','F','R','B', 'L'])
    expect(rover.position).toEqual([-1, 2])
    expect(rover.direction).toEqual('N')
  });


});



