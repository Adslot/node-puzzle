fs = require 'fs'


module.exports = (filename) ->

  data = fs.readFileSync(filename).toString()
  lines = data.split '\n'
  lines.splice 0, 1

  history = []
  for line in lines when line
    line = line.split '\t'
    history.push
      time: new Date line[0]
      open: +line[1]
      high: +line[2]
      low: +line[3]
      close: +line[4]
      volume: +line[5]
      avgPrice: +line[7]

  index = 0

  return next: -> history[index++]
