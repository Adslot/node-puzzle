fs = require 'fs'
RBTree = require('bintrees').RBTree

GEO_FIELD_MIN = 0
GEO_FIELD_MAX = 1
GEO_FIELD_COUNTRY = 2


exports.ip2long = (ip) ->
  ip = ip.split '.', 4
  return +ip[0] * 16777216 + +ip[1] * 65536 + +ip[2] * 256 + +ip[3]


gindex = new RBTree (a, b) ->
  if Array.isArray a
    return a[0] - b[0]
  else
    if (a >= b[0] && a <= b[1])
      return 0;
    else if b[1] < a
      return a - b[1];
    else if a < b[0]
      return a - b[0]
    else
      return false

exports.load = ->
  data = fs.readFileSync "#{__dirname}/../data/geo.txt", 'utf8'
  data = data.toString().split '\n'

  for line in data when line
    line = line.split '\t'
    # GEO_FIELD_MIN, GEO_FIELD_MAX, GEO_FIELD_COUNTRY
    gindex.insert [+line[0], +line[1], line[3]]

normalize = (row) -> country: row[GEO_FIELD_COUNTRY]


exports.lookup = (ip) ->
  return -1 unless ip

  find = this.ip2long ip
  data_found = gindex.find find

  if data_found
    return normalize data_found

  return data_found
