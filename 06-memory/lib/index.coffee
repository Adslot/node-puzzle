fs = require 'fs'

countryCounter = (countryCode) ->
  data = fs.readFileSync "#{__dirname}/../data/geo.txt", 'utf8'
  data = data.toString().split '\n'
  counter = 0

  for line in data when line
    line = line.split '\t'
    # GEO_FIELD_MIN, GEO_FIELD_MAX, GEO_FIELD_COUNTRY
    # line[0],       line[1],       line[3]
    
    if line[3] == countryCode then counter++

  return counter

exports.countryCounter = (countryCode) ->
  return null unless countryCode
  return countryCounter countryCode
