assert = require 'assert'


exports.pack = (data, cb) ->
  cb new Error 'Not implemented'


exports.unpack = (buffer, cb) ->
  assert Buffer.isBuffer buffer
  cb new Error 'Not implemented'
