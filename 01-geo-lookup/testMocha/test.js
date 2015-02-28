describe('geo', function() {

    var assert, genip, geo, octet;
    var expect = require('chai').expect;


    var geo = require('../lib/new');

    octet = function() {
        return ~~(Math.random() * 254);
    };

    genip = function() {
        return (octet()) + "." + (octet()) + "." + (octet()) + "." + (octet());
    };
    describe('ip2long()', function() {
        it('IP should be converted to the long format', function() {
            expect(geo.ip2long('87.229.134.24')).to.equal(1474659864);
            expect(geo.ip2long('217.212.248.160')).to.equal(3654613152);
            expect(geo.ip2long('188.65.186.96')).to.equal(3158424160);
        });
    });
    describe('lookup()', function() {
        before(function() {
            return geo.load();
        });
        it('should find country', function() {
            var result;
            result = geo.lookup('87.229.134.24');
            expect(result.country).to.equal('RU');
            result = geo.lookup('2.20.4.0');
            expect(result.country).to.equal('IT');
        });
        it('should return null for unknown IP', function() {
            var result;
            result = geo.lookup('1.1.1.1');
            expect(result).to.equal(null);
        });
        it.skip('should be freaking fast', function() {
            var diff, i, j, msec, start;
            start = process.hrtime();
            for (i = j = 1; j <= 200; i = ++j) {
                geo.lookup(genip());
            }
            diff = process.hrtime(start);
            msec = Math.round((diff[0] * 1e9 + diff[1]) / 1e6);
            expect(msec).to.be.below(500) //, "It is damn too slow: " + msec + "ms for 10k lookups");
        });
    });
});
