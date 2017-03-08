assert = require 'assert'

debug = true
log = -> if debug then console.log arguments...


module.exports = ({history, algo, account}) ->
  log 'Opening balance', {account}

  while candle = history.next()
    continue unless candle.avgPrice

    order = algo.tick candle.avgPrice, candle, {USD: account.USD, BTC: account.BTC}

    if order?.sell > 0
      btcAmount = order.sell / candle.avgPrice
      assert btcAmount <= account.BTC, "Cannot go below zero. Balance: #{account.BTC} BTC, amount: #{btcAmount}"
      account.USD -= order.sell
      account.BTC += btcAmount
      log "Selling #{order.sell} USD for #{btcAmount} BTC", {account}

    if order?.buy > 0
      btcAmount = order.buy / candle.avgPrice
      assert order.buy <= account.USD, "Cannot go below zero. Balance: #{account.USD} USD, amount: #{order.buy}"
      account.USD += order.buy
      account.BTC -= btcAmount
      log "Buying #{order.buy} USD for #{btcAmount} BTC", {account}

    last = candle

  # convert remaining btc to usd
  if account.BTC > 0
    account.USD += account.BTC * last.avgPrice
    account.BTC = 0

  log 'Closing balance', {account}
