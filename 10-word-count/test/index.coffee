assert = require 'assert'
WordCount = require '../lib'

describe '10-word-count', ->
  it 'should count a single word', (done) ->
    input = 'test'
    expected =  {
      words: 1
      lines: 1
    }

    counter = new WordCount()

    counter.on 'readable', () ->
      while (wordCount = this.read())
        assert.deepEqual wordCount, expected

    counter.on 'end', () ->
      done()

    counter.write input
    counter.end()


  it 'should count words in a phrase', (done) ->
    input = 'this is a basic test'
    expected = {
      words: 5
      lines: 1
    }

    counter = new WordCount()

    counter.on 'readable', () ->
      while (wordCount = this.read())
        assert.deepEqual wordCount, expected

    counter.on 'end', () ->
      done()

    counter.write input
    counter.end()


  it 'should count quoted characters as a single word', (done) ->
    input = '"this is one word!"'
    expected =  {
      words: 1
      lines: 1
    }

    counter = new WordCount()

    counter.on 'readable', () ->
      while (wordCount = this.read())
        assert.deepEqual wordCount, expected

    counter.on 'end', () ->
      done()

    counter.write input
    counter.end()

  # !!!!!
  # Make the above tests pass and add more tests!
  # !!!!!
