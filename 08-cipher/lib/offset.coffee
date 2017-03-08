

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
  plainText = raw_input("What is your plaintext? ")
shift = int(raw_input("What is your shift? "))
 
def caesar(plainText, shift): 
 
    for ch in plainText:
        if ch.isalpha():
            stayInAlphabet = ord(ch) - shift 
            if stayInAlphabet > ord('z'):
                stayInAlphabet -= 26
            finalLetter = chr(stayInAlphabet)
        cipherText = ""
        cipherText += finalLetter
 
    print "Your ciphertext is: ", cipherText
 
    return cipherText
 
caesar(plainText, shift)
  return 'fix me'
