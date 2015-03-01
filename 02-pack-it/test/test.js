
var data, packer;

packer = require('../index');
var expect = require('chai').expect;
var _ = require('underscore');

data = require('./data');

describe('packer', function() {
    var res;
    res = null;
    it('should pack data efficiently', function(done) {
        return packer.pack(data, function(err, buffer) {
            if (err) {
                return done(err);
            }
            res = buffer;
            expect(buffer.length <= 128).to.equal(true);
            done();
        });
    });
    it('should unpack data w/o errors', function(done) {
        return packer.unpack(res, function(err, res) {
            if (err) {
                return done(err);
            }
            //expect(data).to.equal(sample);
            var diff = _.difference(data, res);
            expect(diff.length).to.equal(0);
            return done();
        });
    });
});
