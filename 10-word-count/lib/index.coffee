through2 = require 'through2'


module.exports = ->
  words = 0
  lines = 0
  chars = 0

  transform = (chunk, encoding, cb) ->
    chars = chunk.length
    chunks = chunk.trim().split '\n'
    for line in chunks when line
      line = line.trim().replace(/([a-z])([A-Z])/g, '$1 $2')
      tokens=line.match(/[^" ]+|"[^"]+"/g)
      filterTokens = tokens.filter (token) ->
          myRegExp = /^[0-9A-Za-z]+|"[^"]+"/
          myRegExp.test(token.trim())
        words += filterTokens.length
        lines += 1
    return cb()

  flush = (cb) ->
    this.push {words, lines, chars}
    this.push null
    return cb()

  return through2.obj transform, flush
