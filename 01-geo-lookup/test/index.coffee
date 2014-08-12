assert = require 'assert'
geo = require '../lib'


octet = -> ~~(Math.random() * 254)
genip = -> "#{octet()}.#{octet()}.#{octet()}.#{octet()}"

describe 'geo', ->

  describe 'ip2long()', ->

    it 'IP should be converted to the long format', ->
      assert.equal geo.ip2long('87.229.134.24'), 1474659864
      assert.equal geo.ip2long('217.212.248.160'), 3654613152
      assert.equal geo.ip2long('188.65.186.96'), 3158424160


  describe 'lookup()', ->

    before -> geo.load()

    it 'should find country', ->
      result = geo.lookup '87.229.134.24'
      assert.equal result.country, 'RU'

      result = geo.lookup '2.20.4.0'
      assert.equal result.country, 'IT'

    it 'should return null for unknown IP', ->
      result = geo.lookup '1.1.1.1'
      assert.equal result, null

    it 'should be freaking fast', ->
      start = process.hrtime()

      for i in [1..1e4]
        geo.lookup genip()

      diff = process.hrtime start
      msec = Math.round (diff[0] * 1e9 + diff[1]) / 1e6

      assert msec < 500, "It is damn too slow: #{msec}ms for 10k lookups"
