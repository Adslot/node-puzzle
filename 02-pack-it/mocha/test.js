
var data, packer;

packer = require('../new');
var expect = require('chai').expect;

data = require('../test/data');

describe('packer', function() {
    var res;
    res = null;
    it('should pack data efficiently', function(done) {
        return packer.pack(data, function(err, buffer) {
            if (err) {
                return done(err);
            }
            res = buffer;
            expect(buffer).to.have.length.below(129);
            return done();
        });
    });
    it('should unpack data w/o errors', function(done) {
        return packer.unpack(res, function(err, sample) {
            if (err) {
                return done(err);
            }
            expect(data).to.equal(sample);
            return done();
        });
    });
});
