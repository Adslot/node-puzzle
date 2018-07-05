assert = require 'assert'
WordCount = require '../lib'


helper = (input, expected, done) ->
  pass = false
  counter = new WordCount()

  counter.on 'readable', ->
    return unless result = this.read()
    assert.deepEqual result, expected
    assert !pass, 'Are you sure everything works as expected?'
    pass = true

  counter.on 'end', ->
    if pass then return done()
    done new Error 'Looks like transform fn does not work'

  counter.write input
  counter.end()


describe '10-word-count', ->

  it 'should count a single word', (done) ->
    input = 'test'
    expected = words: 1, lines: 1, chars: 4
    helper input, expected, done

  it 'should count words in a phrase', (done) ->
    input = 'this is a basic test'
    expected = words: 5, lines: 1, chars: 20
    helper input, expected, done

  it 'should count quoted characters as a single word', (done) ->
    input = '"this is one word!"'
    expected = words: 1, lines: 1, chars: 19
    helper input, expected, done

  it 'should count multiple words for camel case word', (done) ->
    input = 'this is MyTest'
    expected = words: 4, lines: 1, chars: 14
    helper input, expected, done

  it 'should count multiple lines', (done) ->
    input = 'this is first line\nthis is my second line'
    expected = words:9, lines: 2, chars: 41
    helper input, expected, done

  it 'should not count word which contains Non Alphanumeric char', (done) ->
    input = 'this is my test $abc'
    expected = words:4, lines:1, chars:20
    helper input, expected, done

  it 'should count correctly for 1,9,44.txt', (done) ->
    input ='The quick brown fox jumps over the lazy dog\n'
    expected = words: 9, lines: 1, chars: 44
    helper input, expected, done

  it 'should count correctly for 3,7,46.txt', (done) ->
    input = 'The\n"Quick Brown Fox"\njumps over the lazy dog\n'
    expected = words: 7, lines: 3, chars: 46
    helper input, expected, done

  it 'should count correctly for 5,9,40.txt', (done) ->
    input = 'TheQuick\nBrownFox\njumps\nOverTheLazy\ndog\n'
    expected = words: 9, lines: 5, chars: 40
    helper input, expected, done

  it 'should count correctly when input contains camel case, multiple line, quoted and non Alphanumeric characters', (done) ->
    input = 'TheFirst line $abc\n"the second line $abc"'
    expected = words: 4, lines: 2, chars: 41
    helper input, expected, done

  # !!!!!
  # Make the above tests pass and add more tests!
  # !!!!!
