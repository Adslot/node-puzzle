(function(data) {



    data.pack = function(data, cb) {

        //Validation
        if (!(data instanceof Array)) {
            cb(new Error('input not an array'));
            return;
        }
        if (data.length === 0) {
            cb(null, '');
            return;
        }

        var pow = 0;
        var n = 0;
        for (var i = data.length - 1; i >= 0; i--) {
            if (data[i]) {
                n += Math.pow(2, pow);
            }
            pow++;
        }
        cb(null, n); //return the binary string of the input result
    };

    data.unpack = function(buffer, cb) {

        //Validation
        if (!buffer) {
            cb(new Error('Missing input'));
            return;
        }

        var bits = [];
        var q = buffer;
        do {
            bits.push(q % 2);
            q = Math.floor(q / 2);
        } while (q > 0);

        var res = [];
        var reverse = bits.reverse();
        for (var i = 0; i < reverse.length; i++) {
            res.push(bits[i] ? true : false);
        }

        cb(null, res);
    };

})(module.exports);
