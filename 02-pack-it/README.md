# 02-pack-it

Imagine that you have a JSON database (yey!) and store config for each user that
keeps information which features are enabled/disabled on website. This config is
an array of *Boolean* flags:

```
[true, false, false, true, false, true, true, ...]
```

Challenge is to write both pack and unpack functions which would significantly
reduce stored data size. Due to content and size of a config, tools like gzip/zip have
quite big overhead, so we are looking for more efficient custom solution. Pack function
should return either *String* or *Buffer* so that content can be stored directly
in file system.

Place your solution in `./index.coffee` file and make tests working.


## Setup

 - To install dependencies run `npm i`
 - To test your solution run `npm test`
