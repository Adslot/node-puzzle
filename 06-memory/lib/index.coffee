fs = require 'fs'
readline = require 'readline'
exports.countryIpCounter = (countryCode,cb) -> 
  return cb() unless countryCode
  counter = 0;
  readStream = fs.createReadStream "#{__dirname}/../data/geo.txt", encoding: 'utf8'
  rl = readline.createInterface readStream 
  rl.on 'line', (line) ->
    items = line.split '\t';
    if items[3] == countryCode then counter += +items[1] - +items[0];

  rl.on 'close', () ->
    cb null, counter