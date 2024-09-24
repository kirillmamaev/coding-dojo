import { Test } from './blank';

describe('Test class', () => {
  it('Has default test value.', () => {
    expect(new Test().test).toEqual('test string');
  });
});