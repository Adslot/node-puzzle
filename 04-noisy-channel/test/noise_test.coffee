Noise = require '../src/noise'
expect = require 'expect.js'


describe 'Noise', ->
  describe 'xorBits', ->
    it 'should xor bit streams', ->
      randomBoolean = -> false
      expect(new Noise({randomBoolean}).xorBits [true, true, true], [false, false, false]).to.eql [true, true, true]
      expect(new Noise({randomBoolean}).xorBits [true, true, true], [true, true, true]).to.eql [false, false, false]
      expect(new Noise({randomBoolean}).xorBits [true, false, true], [true, true, true]).to.eql [false, true, false]

  describe 'applyNoise', ->
    it 'should apply quiet noise to stream', ->
      randomBoolean = -> false
      expect(new Noise({randomBoolean}).applyNoise [true, true, true]).to.eql [true, true, true]

    it 'should apply opposite noise to stream', ->
      randomBoolean = -> true
      expect(new Noise({randomBoolean}).applyNoise [true, true, true]).to.eql [false, false, false]
