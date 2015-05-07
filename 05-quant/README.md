# 05-quant

Let's do some serious business! You need to build a basic trading algorithm  which is at least not losing money. For backtesting (also called historical simulation) we have relatively long period of time - about 5 months trade history with 1 hour intervals, BTC/USD pair. Candle chart with history can be found at http://bitcoincharts.com/charts/btceUSD#rg60zigHourlyzczsg2014-11-30zeg2015-05-01ztgSzm1g10zm2g25zv.


### Simplifications:

 - As we have only candle data, so there are always situations where price can not be uniquely determined. Hence we're using *Weighted Price* only (check `data/history.csv` for details).
 - All orders are executed immediately. Current or available volume is not taken into consideration.
 - No exchange commission fees.
 - No price spread between buy and sell.
 

### What to do:

1. Hack your algo in `./lib/algo.coffee`.
1. Run backtest to make sure it is working by `npm test`.

