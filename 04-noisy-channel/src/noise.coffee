assert = require 'assert'

module.exports = class Noise
  constructor: ({@randomBoolean}) ->
    assert @randomBoolean

  applyNoise: (bits) ->
    assert bits

    noise = @createNoise(bits.length)

    assert.equal noise.length, bits.length

    return @xorBits noise, bits

  createNoise: (length) ->
    assert length

    [0...length].map => @randomBoolean()

  xorBits: (a, b) ->
    assert a
    assert b

    [0...a.length].map (index) ->
      a[index] ^ b[index]
