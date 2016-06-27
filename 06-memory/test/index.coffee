assert = require 'assert'


describe 'reader', ->

  describe 'countryIpCounter()', ->

    it 'should be memory efficient', (done) ->
      heapUsageBefore = process.memoryUsage().heapUsed
      reader = require '../lib'
      reader.countryIpCounter 'RU', (err, result) ->
        if err then return done err

        assert.equal result, 139092612

        heapUsageAfter = process.memoryUsage().heapUsed
        heapUsageIncrease = heapUsageAfter / heapUsageBefore
        assert heapUsageIncrease < 4, "Your heap memory usage increased more than 4 times"

        done()
