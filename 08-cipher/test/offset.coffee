assert = require 'assert'
offset = require '../lib/offset'


describe '08-cipher/lib/offset', ->


  describe 'default secret', ->

    it 'should encrypt/decrypt', ->
      assert.equal offset.encrypt('hello there'), 'gdkkn sgdqd'

    it 'should decrypt', ->
      assert.equal offset.decrypt('gdkkn sgdqd'), 'hello there'


  describe 'custom secret', ->

    it 'should encrypt/decrypt', ->
      assert.equal offset.encrypt('hello there', 13), '[X__b g[XeX'

    it 'should decrypt', ->
      assert.equal offset.decrypt('[X__b g[XeX', 13), 'hello there'
