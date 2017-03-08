
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
statObj =
  nullCount: 0
  sellCount: 0
  buyCount: 0

exports.tick = (price, candle, account) ->
  ret = null

  # Check for the trend by analysing candlestick
  if candle.close > price
    # Handle upwards trend
    if account.USD > 1
      statObj.sellCount += 1
      ret = sell: account.USD - 1
    else
      # do nothing
  else
    #handle downwards trend
    statObj.buyCount += 1
    ret = buy: account.BTC * price - 1

  if ret == null then statObj.nullCount += 1

  #console.log statObj
  return ret
