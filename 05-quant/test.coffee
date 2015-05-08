assert = require 'assert'
history = require './lib/history'
backtest = require './lib/backtest'
algo = require './lib/algo'


describe 'quant', ->

  it 'should not be loosing money (puzzle complete)', ->
    for [0...10]
      account = USD: 1000, BTC: 0

      backtest {
        history: history './data/history.csv'
        account
        algo
      }

      assert account.USD >= 1000.001, "Your algo loses money: start: $1000, end: $#{account.USD}"

  it 'should make 5% profit (bonus)', ->
    for [0...10]
      account = USD: 1000, BTC: 0

      backtest {
        history: history './data/history.csv'
        account
        algo
      }

      assert account.USD >= 1050, "Your algo loses money: goal: $1050, result: $#{account.USD}"

  it 'should make 25% profit (super bonus)', ->
    for [0...10]
      account = USD: 1000, BTC: 0

      backtest {
        history: history './data/history.csv'
        account
        algo
      }

      assert account.USD >= 1250, "Your algo loses money: goal: $1250, result: $#{account.USD}"
