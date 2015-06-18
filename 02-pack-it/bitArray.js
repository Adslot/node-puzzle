var BitArray = function (size) {
  this.values = [];

  for (var i = 0; i < Math.ceil(size / 32); i += 1) {
    this.values[i] = 0;
  }
};

//Returns the total number of bits in this BitArray.
BitArray.prototype.size = function () {
	return this.values.length * 32;
};


//Sets the bit at index to a value (boolean.)
BitArray.prototype.set = function (index, value) {
	var i = Math.floor(index / 32);
	// Since "undefined | 1 << index" is equivalent to "0 | 1 << index" we do not need to initialise the array explicitly here.
	if (value) {
		this.values[i] |= 1 << index - i * 32;
	} else {
		this.values[i] &= ~(1 << index - i * 32);
	}
	return this;
};


//Returns the value of the bit at index (boolean.)
BitArray.prototype.get = function (index) {
	var i = Math.floor(index / 32);
	return !!(this.values[i] & (1 << index - i * 32));
};


//Returns the JSON representation of this BitArray.
BitArray.prototype.toJSON = function () {
	return JSON.stringify(this.values);
};


//Returns a string representation of the BitArray with bits in logical order.
BitArray.prototype.toString = function () {
	return this.toArray().map(function (value) {
		return value ? '1' : '0';
	}).join('');
};

//Convert the BitArray to an Array of boolean values.
BitArray.prototype.toArray = function () {
	var result = [];

    for (var i = 0; i < this.values.length * 32; i += 1) {
        result.push(this.get(i));
    }
	return result;
};

module.exports = BitArray;