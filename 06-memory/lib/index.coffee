lineByLine = require 'n-readlines'

exports.countryIpCounterLineByLine = (countryCode, cb) ->
  return cb() unless countryCode
  counter = 0
  liner = new lineByLine("#{__dirname}/../data/geo.txt", [readChunk=4096])
  re = new RegExp(countryCode, "g")
  while line = liner.next()
    str =  line.toString('utf8')
    if str.match(re) then (
      str = str.split '\t'
      counter += +str[1] - +str[0]
      )
  cb null, counter
