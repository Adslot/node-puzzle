assert = require 'assert'
app = require '../app'

describe 'friday-test-01', ->

  it 'should work if you do not need to build a farm', ->
    assert.equal Math.round(app.answer(30.0, 1.0, 2.0)), 1

  it 'should work if you might need to build a farm', ->
    assert.equal Math.round(app.answer(30.0, 2.0, 100.0)), Math.round(39.1666667)

  it 'should work if you do probably need to build a farm', ->
    assert.equal Math.round(app.answer(30.50000, 3.14159, 1999.19990)), Math.round(63.9680013)

  it 'should work if you definitely need to build a farm', ->
    assert.equal Math.round(app.answer(500.0, 4.0, 2000.0)), Math.round(526.1904762)
