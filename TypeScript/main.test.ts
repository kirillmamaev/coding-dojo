import { main } from './main';

describe('main', () => {
  it('should log the correct message', () => {
    const consoleSpy = jest.spyOn(console, 'log');
    main();
    expect(consoleSpy).toHaveBeenCalledWith('This is main.ts file in TypeScript dojo!');
    consoleSpy.mockRestore();
  });
});
