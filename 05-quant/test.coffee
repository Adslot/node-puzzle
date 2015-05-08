assert = require 'assert'
history = require './lib/history'
_ = require 'lodash'
backtest = require './lib/backtest'
algo = require './lib/algo'


describe 'quant', ->

  result = null

  before ->
    results = []
    for i in [0..10]
      account = USD: 1000, BTC: 0
      backtest {
        history: history './data/history.csv'
        account
        algo
      }
      results.push account

    # Picking worst result
    result = _.min results, (item) -> item.USD


  it 'should not be loosing money (puzzle complete)', ->
    assert result.USD >= 1000.001, "Your algo loses money: start: $1000, end: $#{result.USD}"

  it 'should make 5% profit (bonus)', ->
    assert result.USD >= 1050, "Your algo loses money: goal: $1050, end: $#{result.USD}"

  it 'should make 25% profit (bonus #2)', ->
    assert result.USD >= 1250, "Your algo loses money: goal: $1250, end: $#{result.USD}"

  it 'should make crazy profit (bonus #3)', ->
    assert result.USD >= 4000, "Your algo loses money: goal: $4000, end: $#{result.USD}"

  it 'should make $$$ (bonus #4)', ->
    assert result.USD >= 10000, "Your algo loses money: goal: $10000, end: $#{result.USD}"

  it 'should make what?! (bonus #5)', ->
    assert result.USD >= 50000, "Your algo loses money: goal: $50000, end: $#{result.USD}"
