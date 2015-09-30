# 09-selenium

## Setup

#### Assuming you have already installed [node](https://nodejs.org/), do in your terminal:

```shell
# Clone this repository
$ git clone git@github.com:Adslot/node-puzzle.git
# Go to current dir
$ cd node_puzzle/09-selenium
# Install npm dependencies
$ npm install
```


#### Setup selenium server:

(check for more info https://www.npmjs.com/package/selenium-standalone)

```
$ npm install selenium-standalone@latest -g
$ selenium-standalone install
$ selenium-standalone start
```


## Webdriver documentation

 - General information about working with webdriver: https://code.google.com/p/selenium/wiki/WebDriverJs
 - Webdriver API docs: http://selenium.googlecode.com/git/docs/api/javascript/index.html


## Tasks

Extend `test.coffee` with your scenarios. You don't have to create/edit any other files.

Run `npm test` to make sure your solution works as expected.

1. Contact us page

  Add more checks for contact form (make sure all fields are on the page). Don't click submit button :)

1. Google it

  Try to search "Adslot" in Google, follow the first link and make sure that page title is from our website.

1. Your own test

   Think of your own scenario that tests something meaningful on our adslot.com website.


#### Test your solution:

```
$ npm test
```
