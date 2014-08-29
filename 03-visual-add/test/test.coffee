assert = require 'assert'
adder = require '../index'

describe 'visual add', ->

  it 'should +1 correctly for empty array', ->
    added = adder.add []
    assert.deepEqual added, ["0"]

  it 'should +1 correctly for normal case', ->
    added = adder.add ["1", "2", "3"]
    assert.deepEqual added, ["1", "2", "4"]

  it 'should +1 correctly for edge case', ->
    added = adder.add ["9", "9", "9"]
    assert.deepEqual added, ["1", "0", "0", "0"]