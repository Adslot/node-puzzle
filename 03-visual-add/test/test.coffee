assert = require 'assert'
adder = require '../index'

describe 'visual add', ->

  it 'should +1 correctly for empty array', ->
    added = adder.add []
    assert.deepEqual added, [1]

  it 'should +1 correctly for normal case', ->
    added = adder.add [1, 2, 3]
    assert.deepEqual added, [1, 2, 4]

  it 'should +1 correctly for edge case', ->
    added = adder.add [9, 9, 9]
    assert.deepEqual added, [1, 0, 0, 0]

  it 'should +1 correctly for special case', ->
    added = adder.add [0, 0, 4]
    assert.deepEqual added, [5]

  it 'should support any number', ->
    added = adder.add [9,0,0,7,1,9,9,2,5,4,7,4,0,9,9,2]
    assert.deepEqual added, [9,0,0,7,1,9,9,2,5,4,7,4,0,9,9,3]