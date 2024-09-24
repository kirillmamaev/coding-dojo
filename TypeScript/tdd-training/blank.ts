export class Test {
  private _test: string;

  get test(): string {
    return this._test;
  }

  constructor() {
    this._test = "test string";
  }
}
