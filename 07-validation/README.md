# 07-validation

## Setup

Assuming you have already installed [node](http://nodejs.com),
install dependencies by running `npm install`.

## Introduction

In this puzzle you need to write a validation function in `lib/index.coffee`.
The function will need validate input that looks like:

```javascript
{
  id: 1,
  name: "John",
  email: "test@adslot.com",
  favouriteColour: "#323232",
}
```

To be valid the input must satisfy:

- `id` required, integer, positive
- `name` required, string, 63 character max length
- `email` required, string, 255 character max length
- `favouriteColour` optional, string, colour hex

**Note: there should be no other attributes in the input.**

The data types you need to validate are:

- integer
- string
- email
- hex colour

To make sure it works just do `npm test` from this directory.

## Tasks

To complete this puzzle, you must:

- Fix the two broken tests. (Hint: Do not change the existing tests in `test/index.coffee`!)
- Write more tests to demonstrate your skills finding edge cases and corner cases.

To test your validation functions run `npm test`.
