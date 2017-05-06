# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.
hexColorRegex = require('hex-color-regex')
isHexcolor = require('is-hexcolor')

exports.validate = (data) ->

	emailPattern = /// ^ 	#begin of line
		([a-zA-Z0-9_\.-]+) 	#letters, numbers,_,.,-
		@                  	#followed by an @ sign
		([a-zA-Z0-9_\.-]+) 	#letters, numbers,_,.,- and more
		\.					#then .
		([a-zA-Z\.]{2,6})  	#followed by 1 or more letters or.
		$ ///i             	#end of line and ignore case

  # Very naive checks - change them!
	unless typeof data.id is 'number' and data.id % 1 is 0 and data.id > 0 then return false

	unless 0 < data.name.length <= 63  then return false

	unless data.email.length < 256 and emailPattern.test data.email then return false

	unless 0 <= data.taxRate <= 1 then return false

	#unless hexColorRegex({strict: true}).test(data.favouriteColour) then false
	if isHexcolor(data.favouriteColour) then false

	return true
