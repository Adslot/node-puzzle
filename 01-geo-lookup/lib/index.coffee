fs = require('fs')
intervals = require('./intervals')

tree = new (intervals.SegmentTree)
countryArray = []

exports.load = ->
  data = fs.readFileSync('./data/geo.txt', 'utf8')
  data = data.toString().split('\n')

  data.forEach (line) ->
    if line
      line = line.split('\t')
      tree.pushInterval parseInt(line[0]), parseInt(line[1])
      countryArray.push line[3]
    return
  tree.buildTree()
  return

exports.lookup = (ipAddr) ->
  ip = @ip2long(ipAddr)
  index = tree.queryInterval(ip, ip)
  if index then 'country': countryArray[index - 1] else null

exports.ip2long = (ipAddr) ->
  ipRange = ipAddr.split('.')
  if ipRange.length == 4
    ipRange[0] * 16777216 + ipRange[1] * 65536 + ipRange[2] * 256 + ipRange[3] * 1
  else
    -1
