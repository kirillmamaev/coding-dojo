/**
 * TypeScript Magic: Type Mutation
 * This file demonstrates how TypeScript's type system can be manipulated in unexpected ways.
 * It is not a recommended practice, but it serves as an example of how TypeScript's type system can be circumvented.
 * Use this knowledge responsibly and be aware of the potential pitfalls.
 */

/**
 * Example #1: Type Mutation with Arrays
 */
const stringsOnly: string[] = ['string', 'string too'];

console.log(stringsOnly); // ["string", "string too"]

// This is TypeScript magic.
// We can push a number into an array that is supposed to contain only strings.
// This is a bad practice, but it works.
function pushNumberIntoStringArray(array: (string | number)[], number: number): void {
  array.push(number);
}
pushNumberIntoStringArray(stringsOnly, 777);

// Alternative approach:
// Object.assign(stringsOnly, { [stringsOnly.length]: 777 });

console.log(stringsOnly); // ["string", "string too", 777]

/**
 * Example #2: Type Assertion and Mutation
 */
const iAmString: string[] = ['string'];

console.log(iAmString, typeof iAmString[0]); // ["string"],  "string"

// This will work, and this is expected.
// This is why assertions "as" and type "any" are bad.
// iAmString[0] = 8 as any;
// console.log(iAmString, typeof iAmString[0]); // [8],  "number"

// But this is TypeScript magic.
// We can mutate the type of the first element of the array by passing it to a function
// that expects a different type.
// This is a bad practice, but it works.
function convertStringToNumber(array: (string | number)[], number: number): void {
  array[0] = number;
}
convertStringToNumber(iAmString, 8);

console.log(iAmString, typeof iAmString[0]); // [8],  "number"
