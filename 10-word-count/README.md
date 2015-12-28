# 10-word-count

## Setup

Assuming [node](https://nodejs.org/) is already installed, in your terminal:

```shell
# Clone this repository
git clone git@github.com:Adslot/node-puzzle.git

# Go to working dir
cd node_puzzle/10-word-count

# Install npm dependencies
npm install

# Test your solution
npm test
```

## Introduction

In this puzzle you will need to create a transform stream which counts the number of words and lines in an input stream.
Your transform stream should return exactly one chunk.

- a word may only contain characters A-Z, a-z, and 0-9, or
- a word may contain any character if quoted using double quotes (`"`).
- Camel cased words should be counted as multiple words. (e.g. `FunPuzzle` is 2 words)

A basic transform stream has been provided.
A few test fixtures are provide in `tests/fixtures` with filenames structured `LINES,WORDS,CHARACTERS.txt`.

## Tasks

To complete this puzzle, you must:

- Extend the transform stream to handle quoted strings.
- Extend the transform stream to handle camel cased words.
- Extend the transform stream to count lines.
- Write more tests to demonstrate your skills finding edge cases and corner cases.
- Bonus points: add support for counting characters and bytes.

To test your validation functions run `npm test`.
