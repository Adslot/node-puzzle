
###*
 * This is heart of our trading bot. Function below is called
 * for every candle from the history. As a result an order is
 * expected, however not mandatory.
 *
 * Our dummy algorithm works as following:
 *  - in 1/3 of cases we sell $1
 *  - in 1/3 of cases we buy $1
 *  - in 1/3 of cases we do nothing
 *
 * @param {float}   [price]   Average (weighted) price
 * @param {Object}  [candle]  Candle data with `time`, `open`, `high`, `low`, `close`,
 *                            `volume` values for given `time` interval.
 * @param {Object}  [account] Your account information. It has _realtime_ balance of USD and BTC
 * @returns {object}          An order to be executed, can be null
###
exports.tick = (price, candle, account) ->
  r = Math.random()
  amount = 1

  # Sell 1 dollar for equivalent amount of btc
  if r < 0.33 and account.USD > amount then return sell: amount

  # Buy 1 dollar for equivalent amount of btc
  if r < 0.66 and account.BTC > amount / price then return buy: amount

  return null # do nothing
