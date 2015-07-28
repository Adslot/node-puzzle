assert = require 'assert'
alphabet = require '../lib/alphabet'


describe '08-cipher/lib/alphabet', ->

  it 'should encrypt/decrypt', ->
    assert.equal alphabet.encrypt('hello there'), 'ᐈᐅᐌᐌᐏᐚ⊟ᐈᐅᐒᐅ'

  it 'should decrypt', ->
    assert.equal alphabet.decrypt('ᐈᐅᐌᐌᐏᐚ⊟ᐈᐅᐒᐅ'), 'hello there'


