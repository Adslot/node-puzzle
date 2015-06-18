module.exports.Interval = Interval;
module.exports.IntervalStack = IntervalStack;
module.exports.SegmentTree = SegmentTree;

function Interval(from, to) {
  this.id = ++Interval.prototype.id;
  this.from = from;
  this.to = to;
}

Interval.prototype.id = 0;
Interval.const = Interval.prototype;
Interval.prototype.SUBSET = 1;
Interval.prototype.DISJOINT = 2;
Interval.prototype.INTERSECT_OR_SUPERSET = 3;

Interval.prototype.compareTo = function(other) {
  if (other.from > this.to || other.to < this.from) return this.DISJOINT;
  if (other.from <= this.from && other.to >= this.to) return this.SUBSET; 
  return this.INTERSECT_OR_SUPERSET;
}

// endpoints of intervals included
Interval.prototype.disjointIncl = function(other) {
  if (other.from > this.to || other.to < this.from) return this.DISJOINT;
}

// two intervals that share only endpoints are seen as disjoint
Interval.prototype.disjointExcl = function(other) {
  if (other.from >= this.to || other.to <= this.from) return this.DISJOINT;
}

function IntervalStack(intervals, queryIntervalFn) {
  this._intervals = intervals;
  this._queryInterval = queryIntervalFn;
}

IntervalStack.prototype = (function() {
  return {
    constructor: IntervalStack,
    pushInterval: pushInterval,
    pushArray: pushArray,
    clearIntervalStack: clearIntervalStack,
    queryPoint: queryPoint,
    queryPointArray: queryPointArray,
    queryInterval: queryInterval,
    queryIntervalArray: queryIntervalArray
  };
})();

function _validateInterval(from, to) {
  if (typeof from !== 'number' || typeof to !== 'number') throw {
    name: 'InvalidInterval',
    message: 'endpoints of interval must be of type number'
  };
  if (from > to) throw {
    name: 'InvalidInterval',
    message: '(' + from + ',' + to + ')' + ' a > b'
  };
}

function _validateIntervalArray(from, to) {
  if (!(from instanceof Array && to instanceof Array)) throw {
    name: 'InvalidParameter',
    message: 'function pushArray: parameters must be arrays'
  };
  if (from.length !== to.length) throw {
    name: 'InvalidParameter',
    message: 'function pushArray: arrays must have same length'
  };
  for(var i = 0; i < from.length; i++) {
    _validateInterval(from[i], to[i]);
  }
}

function _validatePoint(point) {
  if (typeof point !== 'number') throw {
    name: 'InvalidParameter',
    message: 'parameter must be a number'
  };
}

function _validatePointArray(points) {
  if (!(points instanceof Array)) throw {
    name: 'InvalidParameter',
    message: 'parameter must be an array'
  };
  for(var i = 0; i < points.length; i++) {
    if (typeof points[i] !== 'number') throw {
      name: 'InvalidParameter',
      message: 'array must consist only of numbers'
    }
  }
}


function pushInterval(from, to) {
  _validateInterval(from, to);
  this._intervals.push(new Interval(from, to));
}

function pushArray(from, to, validate) {
  var val = (validate !== undefined) ? validate : true;
  if (val) _validateIntervalArray(from, to);
  for(var i = 0; i < from.length; i++) {
    this._intervals.push(new Interval(from[i], to[i]));
  }
}

function clearIntervalStack() {
  this._intervals.length = 0;
  Interval.prototype.id = 0;
}

function queryPoint(point, resultFn) {
  _validatePoint(point);
  return this.queryPointArray([point], resultFn);
}

function queryPointArray(points, resultFn, validate) {
  var val = (validate !== undefined) ? validate : true;
  if (val) _validatePointArray(points);
  var intervalArray = points.map(function(item) {
    return new Interval(item, item);
  });
  return this._queryInterval(intervalArray, resultFn);
}

// options: endpoints, resultFn
function queryInterval(from, to, options) {
  _validateInterval(from, to);
  return this.queryIntervalArray([from], [to], options);
}

// options: endpoints, resultFn, validate
function queryIntervalArray(from, to, options) {
  var intervalArray = [];
  var val = (options !== undefined && options.validate !== undefined) ? options.validate : true;
  var resFn = (options !== undefined && options.resultFn !== undefined) ? options.resultFn : undefined;
  var disjointFn = (options !== undefined && options.endpoints === false) ? Interval.prototype.disjointExcl : Interval.prototype.disjointIncl;
  if (val) _validateIntervalArray(from, to);
  for(var i = 0; i < from.length; i++) {
    intervalArray.push(new Interval(from[i], to[i]));
  }
  return this._queryInterval(intervalArray, resFn, disjointFn);
}

function Node(from, to) {
  this.left = null;
  this.right = null;
  this.segment = new Interval(from, to);
  this.intervals = [];
}

var root = null;
var _intervals = [];

function SegmentTree() {
  if (!(this instanceof SegmentTree)) return new SegmentTree;
  IntervalStack.call(this, _intervals, _queryInterval);
}

SegmentTree.prototype = new IntervalStack(_intervals, _queryInterval);

SegmentTree.prototype.constructor = SegmentTree;
SegmentTree.prototype.buildTree = buildTree;
SegmentTree.prototype.printTree = printTree;
SegmentTree.prototype.printTreeTopDown = printTreeTopDown;

module.exports.SegmentTree = SegmentTree;

function _endpointArray() {
  var endpoints = [];
  endpoints.push(-Infinity);
  endpoints.push(Infinity);
  _intervals.forEach(function(item) {
    endpoints.push(item.from);
    endpoints.push(item.to);
  });
  return _sortAndDeDup(endpoints, function(a, b) {
    return (a - b);
  });
}

function _sortAndDeDup(unordered, compFn) {
  var result = [];
  var prev;
  unordered.sort(compFn).forEach(function(item) {
    var equal = (compFn !== undefined && prev !== undefined) ? compFn(prev, item) === 0 : prev === item; 
    if (!equal) {
      result.push(item);
      prev = item;
    }
  });
  return result;
}

function _insertElements(pointArray) {
  var node;
  if (pointArray.length === 2) {
    node = new Node(pointArray[0], pointArray[1]);
    if (pointArray[1] !== Infinity) {
      node.left = new Node(pointArray[0], pointArray[1]);
      node.right = new Node(pointArray[1], pointArray[1]);
    }
  } else {
    node = new Node(pointArray[0], pointArray[pointArray.length - 1]);
    // split array in two halfs
    var center = Math.floor(pointArray.length / 2);
    node.left = _insertElements(pointArray.slice(0, center + 1));
    node.right = _insertElements(pointArray.slice(center));
  }
  return node;
}

function _insertInterval(node, interval) {
  switch(node.segment.compareTo(interval)) {
    case Interval.const.SUBSET:
      // interval of node is a subset of the specified interval or equal
      node.intervals.push(interval);
      break;
    case Interval.const.INTERSECT_OR_SUPERSET:
      // interval of node is a superset, have to look in both childs
      if (node.left) _insertInterval(node.left, interval);
      if (node.right) _insertInterval(node.right, interval);
      break;
    case Interval.const.DISJOINT:
      // nothing to do
      break;
  }
}

function _traverseTree(node, enterFn, leaveFn) {
  if (node === null) return;
  // callback when enter node
  if (enterFn !== undefined) enterFn(node);
  _traverseTree(node.right, enterFn, leaveFn);
  _traverseTree(node.left, enterFn, leaveFn);
  // callback before leave
  if (leaveFn !== undefined) leaveFn(node);
}

function _tree2Array(node, level, array) {
  if (node === null) return;
  if (level === undefined) level = -1;
  if (array === undefined) array = [];
  level++;
  if (!array[level]) array[level] = [];
  array[level].push(node);
  _tree2Array(node.right, level, array);
  _tree2Array(node.left, level, array);
  return array;
}

function _query(node, queryIntervals, hits, disjointFn) {
  if (node === null) return;
  var notDisjoint = [];
  queryIntervals.forEach(function(queryInterval) {
    if (disjointFn.call(node.segment, queryInterval) !== Interval.const.DISJOINT) {
      node.intervals.forEach(function(interval) {
        hits[interval.id] = interval;
      });
      notDisjoint.push(queryInterval);
    }
  });
  if (notDisjoint.length !== 0) {
    _query(node.right, notDisjoint, hits, disjointFn);
    _query(node.left, notDisjoint, hits, disjointFn);
  }
}

function _queryInterval(intervalArray, resultFn, disjointFn) {
  var hits = {};
  if (disjointFn === undefined) disjointFn = Interval.prototype.disjointIncl;
  _query(root, intervalArray, hits, disjointFn);
  var intervalArray = Object.keys(hits).map(function(key) {
    return hits[key];
  });
  if (resultFn !== undefined && typeof resultFn === 'function') resultFn(intervalArray);
  if (intervalArray[0])
    return intervalArray[0].id;
  else
    return null;
}

function buildTree() {
  if (_intervals.length === 0) throw { name: 'BuildTreeError', message: 'interval stack is empty' };
  root = _insertElements(_endpointArray());
  _intervals.forEach(function(item) {
    _insertInterval(root, item);
  });
}

function printTree() {
  _traverseTree(root, function(node) {
    console.log('\nSegment: (%d,%d)', node.segment.from, node.segment.to);
    node.intervals.forEach(function(item, pos) {
      console.log('Interval %d: (%d,%d)', pos, item.from, item.to);
    });
  });
}

function printTreeTopDown() {
  _tree2Array(root).forEach(function(item, pos) {
    console.log('Level %d:', pos);
    item.forEach(function(item, pos) {
      console.log('Segment %d: (%d,%d)', pos, item.segment.from, item.segment.to);
      item.intervals.forEach(function(item, pos) {
        console.log('  Interval %d: (%d,%d)', pos, item.from, item.to);
      });
    });
  });
}
