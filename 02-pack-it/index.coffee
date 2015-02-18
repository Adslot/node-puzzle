BitArray = require('./bitArray')

byte2bits = (a) ->
  tmp = ''
  i = 128
  while i >= 1
    tmp += if a & i then '1' else '0'
    i /= 2
  tmp

convertToBits = (array) ->
  buff = []
  i = 0
  while i < array.length
    byte2bits(array[i]).split('').forEach (value) ->
      buff.push value
      return
    i++
  buff

stringToBytes = (str) ->
  charCode = undefined
  stack = undefined
  byteArray = []
  j = 0
  i = 0
  while i < str.length
    charCode = str.charCodeAt(i)
    if charCode < 127
      byteArray[j++] = charCode & 0xFF
    else
      stack = []
      # clear stack
      loop
        stack.push charCode & 0xFF
        # push byte to stack
        charCode = charCode >> 8
        # shift value down by 1 byte
        unless charCode
          break
      # add stack contents to result
      stack = stack.reverse()
      # done because chars have "wrong" endianness
      k = 0
      while k < stack.length
        byteArray[j++] = stack[k]
        ++k
    i++
  # return an array of bytes
  byteArray

exports.pack = (booleanArray, callback) ->
  bitArray = new BitArray(booleanArray.length)
  i = 0
  while i < booleanArray.length
    bitArray.set i, booleanArray[i]
    i++
  bitString = bitArray.toString()
  length = Math.floor(booleanArray.length / 8)
  array2String = ''
  i = 0
  while i < length
    start = i * 8
    end = start + 8
    byteSlice = bitString.substring(start, end)
    array2String += String.fromCharCode(parseInt(byteSlice, 2))
    i++
  callback null, array2String
  return

exports.unpack = (packedString, callback) ->
  if !packedString
    return null
  byteArray = stringToBytes(packedString)
  unpackedString = convertToBits(byteArray)
  unpacked = new BitArray(unpackedString.length)
  i = 0
  while i < unpackedString.length
    unpacked.set i, if unpackedString[i] == '1' then true else false
    i++
  callback null, unpacked.toArray()
  return
