Transmitter = require '../src/transmitter'
expect = require 'expect.js'
sinon = require 'sinon'
assert = require 'assert'

describe 'Transmitter', ->
  describe 'transmit()', ->
    it 'should encode, add noise, then decode', ->
      encoder =
        encode: sinon.spy (bits) -> bits
        decode: sinon.spy (bits) -> bits

      noise =
        applyNoise: sinon.spy (bits) -> bits.map (b) -> not b

      transmitter = new Transmitter {encoder, noise}

      expect(transmitter.transmit [true, true, true]).to.eql [false, false, false]

      assert encoder.encode.calledOnce
      assert encoder.decode.calledOnce
      assert noise.applyNoise.calledOnce
