
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
  sellUpwards: 0
  sellDownwards: 0
  buyUpwards: 0
  buyDownwards: 0

exports.tick = (price, candle, account) ->
  ret = null

  # Check if Green candle or a red candle
  if candle.open < candle.close
    # Check if a upwards trend
    if candle.close > price
      if account.USD > 1
        statObj.sellCount += 1
        ret = sell: account.USD - 1
      else
        statObj.toSellUpwards += 1
    else
      statObj.sellDownwards += 1
      ret = buy: account.BTC * price - 1

  else
    # Check if a downwards trend
    if candle.close <= price
      statObj.buyDownwards += 1
      statObj.buyCount += 1
      ret = buy: account.BTC * price - 1
    else
      if account.USD > 1
        statObj.sellCount += 1
        ret = sell: account.USD - 1
      else
        statObj.buyUpwards += 1

  if ret == null then statObj.nullCount += 1

  console.log statObj
  return ret
