

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
sentence = raw_input("Please enter a sentence : ").lower()
newString = ''
validLetters = "abcdefghijklmnopqrstuvwxyz " #adding whitespace to valid chars...
space = []
for char in sentence:
    if char in validLetters or char in space:
        newString += char
shift = input("Please enter your shift : ")
resulta = []
for ch in newString:
    x = ord(ch)
    x = x+shift
    # special case for whitespace...
    resulta.append(chr(x if 97 <= x <= 122 else 96+x%122) if ch != ' ' else ch)
print sentence
print("")
print("Your encryption is :")
print("")
print ''.join(resulta)
  return 'fix me'
