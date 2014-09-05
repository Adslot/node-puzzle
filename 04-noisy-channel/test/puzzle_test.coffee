Noise = require '../src/noise'
Transmitter = require '../src/transmitter'
expect = require 'expect.js'
Encoder = require '../src/encoder'

describe 'Noise transmitter', ->
  describe 'encode/decode', ->
    n = 5

    test = (noiseProbability) ->
      randomBoolean = -> Math.random() >= 1 - noiseProbability

      noise = new Noise({randomBoolean})
      encoder = new Encoder()

      transmitter = new Transmitter {encoder, noise}

      bits = [0...n].map -> Math.random() >= 0.5

      expect(transmitter.transmit bits).to.eql bits

    it 'TRIVIAL: should be able to transmit signal without loss on perfect channel', ->
      for i in [0..100]
        test 0

    it 'YOU WON: should be able to transmit signal without loss on slightly noise channel', ->
      for i in [0..100]
        test 0.2

    it 'BONUS: should be able to transmit signal without loss on very noise channel', ->
      for i in [0..100]
        test 0.7
