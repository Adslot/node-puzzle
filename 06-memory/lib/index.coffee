fs = require 'fs'

readline = require('readline')

exports.countryIpCounter = (countryCode, cb) ->
  return cb() unless countryCode

  fs.readFile "#{__dirname}/../data/geo.txt", 'utf8', (err, data) ->
    if err then return cb err

    data = data.toString().split '\n'
    counter = 0

    for line in data when line
      line = line.split '\t'
      # GEO_FIELD_MIN, GEO_FIELD_MAX, GEO_FIELD_COUNTRY
      # line[0],       line[1],       line[3]

      if line[3] == countryCode then counter += +line[1] - +line[0]

    cb null, counter
    # console.log(counter)
