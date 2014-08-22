assert = require 'assert'

chr = (c) -> c.charCodeAt(0)
asc = (i) -> String.fromCharCode(i)

rotn = (n, s) ->
  xs = s.split('').map (c) ->
    if c in [' ', '-']
      c
    else
      if /[a-z]/.test c
        asc chr('a') + (((chr(c) - chr('a'))+n) + 26) % 26
      else
        asc chr('A') + (((chr(c) - chr('A'))+n) + 26) % 26
  return xs.join('')

text = 'We are not interested in the fact that the brain has the consistency of cold porridge -- Alan Turing'

out = rotn(4, text[0..text.length/2]) + rotn(2, text[text.length/2+1..])
ino = rotn(-4, out[0..out.length/2]) + rotn(-2, out[out.length/2+1..])
console.log out
assert.equal ino, text

out = 'Ai evi rsx mrxiviwxih mr xli jegx xlex xli fvemr leu vjg eqpukuvgpea qh eqnf rqttkfig -- Cncp Vwtkpi'
