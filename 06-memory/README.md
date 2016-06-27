# 06-memory

The challenge is to craft an optimized algorithm so that country IP address counter
would be memory efficient, edit `lib/index.coffee` file. You are not allowed to change content of either test files
or data file `geo.txt`. The aim is to get unit tests passing.


## Setup

 - To install dependencies run `npm i`
 - To test your solution run `npm test`


## Data file format

Each line of data file contains a range of IP addresses and the corresponding
country to which those addresses belong. Format is the following:

```
100237312  100245503  5.249.128.0 - 5.249.159.255  IT
```

Values are separated by tabulation. Where:

 - `100237312` is a start of the range of ip in long format
 - `100245503` is an end of the range of ip in long format
 - `5.249.128.0 - 5.249.159.255` is a human readable ip range
 - `IT` is a country ISO code, in this case it is Italy
