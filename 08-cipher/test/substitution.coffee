assert = require 'assert'
substitution = require '../lib/substitution'


describe '08-cipher/lib/substitution', ->

  it 'should encrypt/decrypt', ->
    assert.equal substitution.encrypt('hello there'), 'ᐈᐅᐌᐌᐏᐚ⊟ᐈᐅᐒᐅ'

  it 'should decrypt', ->
    assert.equal substitution.decrypt('ᐈᐅᐌᐌᐏᐚ⊟ᐈᐅᐒᐅ'), 'hello there'


