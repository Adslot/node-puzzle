# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  # Very naive checks - change them!
  if data.id < 0 then return false

  if data.name isnt 'John Doe' then return false

  if !/\w+@\w+/.test data.email then return false

  return true
  
  assert   = require 'assert'
 {validate} = require '../lib'
  
  it 'should return `true` for valid data', ->
    assert validate
  {
  id: 9,
  name: "Syeda",
  email: "syeda@mail.com",
  taxRate: 5.9,
  favouriteColour: "#32343223",
  interests: ["tesing", "coding"]
}

it 'should return `false` for invalid data: name and email, ->
    assert !validate
    
    {
  id: 5,
  name: "Syeda123",
  email: "syeda@syeda@.com",
  taxRate: 0.1,
  favouriteColour: "#323232",
  interests: ["Testing", "coding"]
}
