(function(data) {

    var maxCharBitSize = 8;

    data.pack = function(arr, cb) {

        //Validation
        if (!(arr instanceof Array)) {
            cb(new Error('input not an array'));
            return;
        }
        if (arr.length === 0) {
            cb(null, '');
            return;
        }

        var charCounter = 0;
        var letterCode = 0;

        var res = [];
        for (var i = 0 ; i<arr.length; ++i) { //take each 8 group of flags, and convert them to a 8 bit number, and store them as a ASCII representation character
            var flag = arr[i];
            if (flag) { //true value
                letterCode = letterCode | Math.pow(2, charCounter);
            }
            charCounter+= 1;
            if (charCounter === maxCharBitSize) { //push the code in bit format as a letter to resulting array and reset counter values
                var char = String.fromCharCode(letterCode);
                res.push(char);
                charCounter = 0
                letterCode = 0;
            }
        }

        cb(null, res.join(''));
    };

    data.unpack = function(buffer, cb) {

        //Validation
        if (!buffer) {
            cb(new Error('Missing input'));
            return;
        }

        var res = [];

        for (var index = 0 ; index<buffer.length; ++index) {
            var numBitwise = buffer[index].charCodeAt().toString(2);

            if (numBitwise.length < maxCharBitSize) { //complete to 8 bit string representation with leading zeros on the left
                for (var len = numBitwise.length ; len < maxCharBitSize ; ++len) {
                    numBitwise = '0' + numBitwise;
                }
            }

            for (var charCounter = maxCharBitSize-1 ;  charCounter >= 0 ; --charCounter) { //write bits to resulting array
                res.push(parseInt(numBitwise[charCounter], 10) === 1);
            }
        }


        cb(null, res);
    };

})(module.exports);
