
exports.pack = (data, cb) ->
  d = 8
  x = 0
  s = ''

  for i in [0..data.length-1]
    if d > 0
      x = (x << 1) | (if data[i] then 1 else 0)
      d--

    if i is data.length - 1
      padding = (data.length + 8) % 8
      while padding--
        x = (x << 1)

    if d is 0
      s += String.fromCharCode(x)
      d = 8
      x = 0

  cb null, s

exports.unpack = (buffer, cb) ->
  data = []
  for i in [0..buffer.length-1]
    x = buffer.charCodeAt(buffer.length - i - 1)
    for j in [0..7]
      data.unshift(if x&1 then true else false)
      x = x >> 1

  cb null, data
