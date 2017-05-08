

exports.encrypt = (string, secret = 1) ->
  result = ''
  for char in string
    code = char.charCodeAt(0)
    if code <= 41
      result += char
    else
      result += String.fromCharCode(code - secret)

  return result


exports.decrypt = (string, secret = 1) ->
  #
  # !!! Place your solition here !!!
  #
  decrptedString = ''
  for char in string
    unicode = char.charCodeAt(0)
    if unicode <= 41
      decrptedString += char
    else
      decrptedString += String.fromCharCode(unicode + secret)
    
  return decrptedString
