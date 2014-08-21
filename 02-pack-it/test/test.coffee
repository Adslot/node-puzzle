assert = require 'assert'
packer = require '../index'
data = require './data'


describe 'packer', ->

  res = null

  it 'should pack data efficiently', (done) ->
    packer.pack data, (err, buffer) ->
      if err then return done err
      res = buffer
      assert buffer.length <= 128
      done()

  it 'should unpack data w/o errors', (done) ->
    packer.unpack res, (err, sample) ->
      if err then return done err
      assert.deepEqual data, sample
      done()
