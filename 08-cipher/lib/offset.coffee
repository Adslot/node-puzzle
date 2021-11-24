

exports.encrypt = (string, secret = 1) ->
  result = ''
  for char in string
    code = char.charCodeAt(0)
    if code <= 41
      result += char
    else
      result += String.fromCharCode(code - secret)

  return result


  exports.decrypt = (string) ->
  result = ''
  for char in string
    index = alphabet0.indexOf char
    if index is -1
      result += char
    else
      result += alphabet1[index]

  return result

 
