
#
# Build your comprehensive validation function here!
# Feel free to use any third party tools for data validation. Check http://npmjs.org/ to pick
# one or two popular validation modules from Nodejs community.
exports.validate = (data) ->

  # Very naive checks - change them!
  if data.id < 0 then return false

  if data.fees.base <= 0 then return false
  if data.fees.custom <= 0 then return false

  if !data.terms then return false

  if !/\w+@\w+/.test data.email then return false

  if !data.brand then return false

  return true
