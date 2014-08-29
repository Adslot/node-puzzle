'use strict'

exports.add = (arr) ->
  if arr.length is 0
    return [1]

  result = []
  i = arr.length - 1

  c = 1
  while i >= 0
    x = arr[i] + c
    result.unshift x % 10
    c = Math.floor(x/10)
    i--

  if c
    result.unshift c

  # shrink
  while result[0] is 0
    result.shift()

  return result
