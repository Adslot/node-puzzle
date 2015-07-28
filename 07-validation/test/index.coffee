assert   = require 'assert'
{validate} = require '../lib'


describe '07-validation', ->

  it 'should return `true` for valid data', ->
    assert validate
      id: 1
      fees:
        base: 0.05
        custom: 0.15
      terms: true
      email: 'foo@bar.com'
      brand:
        logo: 'http://foobar.com/logo.gif'
        website: 'http://foobar.com/'
        name: 'Foobar'
        colors:
          header: '#ff6'
          footer: '#ccccff'
      browsers: [
        {name: 'chrome', version: 25}
        {name: 'safari', version: 11}
      ]

  it 'should return `false` for invalid data: fees', ->
    assert !validate
      id: 1
      fees:
        base: 0
        custom: 0
      terms: true
      email: 'foo@bar.com'
      brand:
        logo: 'http://foobar.com/logo.gif'
        website: 'http://foobar.com/'
        name: 'Foobar'
        colors:
          header: '#ff6'
          footer: '#ccccff'
      browsers: [
        {name: 'chrome', version: 25}
        {name: 'safari', version: 11}
      ]

  it 'should return `false` for invalid data: terms', ->
    assert !validate
      id: 1
      fees:
        base: 0.05
        custom: 0.15
      terms: false
      email: 'foo@bar.com'
      brand:
        logo: 'http://foobar.com/logo.gif'
        website: 'http://foobar.com/'
        name: 'Foobar'
        colors:
          header: '#ff6'
          footer: '#ccccff'
      browsers: [
        {name: 'chrome', version: 25}
        {name: 'safari', version: 11}
      ]

  it 'should return `false` for invalid data: fees', ->
    assert !validate
      id: 1
      fees:
        base: 2 # <--- problem
        custom: 3 # <--- problem
      terms: true
      email: 'foo@bar.com'
      brand:
        logo: 'http://foobar.com/logo.gif'
        website: 'http://foobar.com/'
        name: 'Foobar'
        colors:
          header: '#ff6'
          footer: '#ccccff'
      browsers: [
        {name: 'chrome', version: 25}
        {name: 'safari', version: 11}
      ]

  it 'should return `false` for invalid data: email', ->
    assert !validate
      id: 1
      fees:
        base: 2
        custom: 3
      terms: true
      email: 'foo@bar@baz.com' # <--- problem
      brand:
        logo: 'http://foobar.com/logo.gif'
        website: 'http://foobar.com/'
        name: 'Foobar'
        colors:
          header: '#ff6'
          footer: '#ccccff'
      browsers: [
        {name: 'chrome', version: 25}
        {name: 'safari', version: 11}
      ]

  # !!!!!
  # Add more tests for different data users can ship to our app!
  # !!!!!
