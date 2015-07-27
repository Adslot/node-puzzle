# 07-validation

## Setup

To install dependencies run `npm i`

## Intro

In this puzzle you're required to write a validation function in `lib/index.coffee`. To make sure it works just do `npm test` from this directory. 

What you need: 
 - There're two tests broken, you'll need to fix them, see `test/index.coffee`.
 - Cover all possible shapes of invalid data you can receive and write tests for there cases. See *Data structure* below.

## Test

To test your solution run `npm test`


## Data structure

 - `id` required, positive integer
 - `fees` required
 - `fees.base` required, positive float, "1" max
 - `fees.custom` required, positive float, "1" max
 - `terms` required, boolean, should always be "true"
 - `email` required, email, 255 max length
 - `brand` required
 - `brand.logo` required, url, max length 255
 - `brand.website` required, url, max length 255
 - `brand.name` optional, string, max length 32
 - `brand.colors` optional
 - `brand.colors.header` required, string, color hex
 - `brand.colors.footer` required, string, color hex
 - **No extra params accepted**




