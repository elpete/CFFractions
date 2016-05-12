# CFFractions

## A simple CFML whole value implementation of fractions

[![Master Branch Build Status](https://img.shields.io/travis/elpete/CFFractions/master.svg?style=flat-square)](https://travis-ci.org/elpete/CFFractions)


### Fraction

#### `plus`

```cfc
	var f1 = new CFFractions.models.Fraction(1, 5);
	var f2 = new CFFractions.models.Fraction(2, 3);
	var sum = f1.plus(f2);
	writeDump(sum.toString()); // 13/15
```

#### `minus`

```cfc
	var f1 = new CFFractions.models.Fraction(5, 6);
	var f2 = new CFFractions.models.Fraction(1, 6);
	var difference = f1.minus(f2);
	writeDump(difference.toString()); // 2/3
```

#### `times`

```cfc
	var f1 = new CFFractions.models.Fraction(2, 6);
	var f2 = new CFFractions.models.Fraction(-1, 6);
	var product = f1.times(f2);
	writeDump(product.toString()); // -1/18
```

#### `divdedBy`

```cfc
	var f1 = new CFFractions.models.Fraction(1, 5);
	var f2 = new CFFractions.models.Fraction(2, -3);
	var quotient = f1.divdedBy(f2);
	writeDump(quotient.toString()); // -3/10
```

#### `equalsFraction`

```cfc
	var f1 = new CFFractions.models.Fraction(1, 5);
	var f2 = new CFFractions.models.Fraction(2, 10);
	var same = f1.equalsFraction(f2);
	writeDump(same); // true
```

### Factory

#### `make`

```cfc
	var factory = new CFFractions.models.Factory();
	var fraction = factory.make(3, 4);
	writeDump(fraction.toString()); // 3/4
```

### WireBox Integration

Inject `Factory` in to your component using `Factory@CFFractions`.  This lets you avoid having to specify `initArguments` in your `createInstance` calls.