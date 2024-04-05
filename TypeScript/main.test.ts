import { Main } from './main';

describe('Main', () => {
  it('should log the correct message', () => {
    const consoleSpy = jest.spyOn(console, 'log');
    new Main();
    expect(consoleSpy).toHaveBeenCalledWith('This is main.ts file in TypeScript dojo!');
    consoleSpy.mockRestore();
  });
});
