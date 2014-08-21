assert = require 'assert'
packer = require '../index'
data = require './data'


describe 'packer', ->

  res = null

  it 'should pack data efficiently', (done) ->
    packer.pack data, (err, buffer) ->
      res = buffer
      assert buffer.length <= 128
      done err

  it 'should unpack data w/o errors', (done) ->
    packer.unpack res, (err, sample) ->
      assert.deepEqual data, sample
      done err
