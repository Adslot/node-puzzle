# 07-validation

## Setup

Assuming you have already installed [node](https://nodejs.org/), do in your terminal:

```shell
# Clone this repository
$ git clone git@github.com:Adslot/node-puzzle.git
# Go to current dir
$ cd node_puzzle/07-validation
# Install npm dependencies
$ npm install
# Test your solution
$ npm test
```

## Introduction

In this puzzle you need to write a validation function in `lib/index.coffee`.
The function will need validate input that looks like:

```javascript
{
  id: 1,
  name: "John",
  email: "test@adslot.com",
  taxRate: 0.1,
  favouriteColour: "#323232",
  interests: ["cycling", "programming"]
}
```

To be valid the input must satisfy:

- `id` required, integer, positive
- `name` required, string, 63 character max length
- `email` required, string, 255 character max length
- `taxRate` required, float, minimum 0 and maximum 1
- `favouriteColour` optional, string, colour hex
- `interests` optional, array, all interests must be strings (31 char max length) and no more than 4 interests should be provided

**Note: there should be no other attributes in the input.**

To make sure it works just do `npm test` from this directory.

## Tasks

To complete this puzzle, you must:

- Fix the two broken tests. (Hint: Do not change the existing tests in `test/index.coffee`!)
- Write more tests to demonstrate your skills finding edge cases and corner cases.

To test your validation functions run `npm test`.
