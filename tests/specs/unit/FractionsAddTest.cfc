component displayname='FractionsAddTest' extends='testbox.system.BaseSpec' {
	function run() {
		describe('compatibility with integers', function() {
			it('can add zero and zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(0);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(0))).toBeTrue();
			});

			it('can add non-zero and zero', function() {
				var f1 = new models.Fraction(3);
				var f2 = new models.Fraction(0);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(3))).toBeTrue();
			});

			it('can add zero and non-zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(5);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(5))).toBeTrue();
			});

			it('can add two non-zero, non-negative operands', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(4);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(6))).toBeTrue();
			});

			it('can add negative opearnds', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(-1);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(1))).toBeTrue();
			});

			it('can get a negative output', function() {
				var f1 = new models.Fraction(-3);
				var f2 = new models.Fraction(1);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(-2))).toBeTrue();
			});
		});

		describe('fraction addition', function() {
			it('can add non-trivial, but equal denominators', function() {
				var f1 = new models.Fraction(1, 5);
				var f2 = new models.Fraction(2, 5);
				var sum = f1.plus(f2);
				expect(sum.getNumerator()).toBe(3);
				expect(sum.getDenominator()).toBe(5);
			});

			it('can add non-trivial, non-equal denominators', function() {
				var f1 = new models.Fraction(1, 2);
				var f2 = new models.Fraction(3, 4);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(5, 4))).toBeTrue();
			});

			it('reduces the result even when the denominator is the same', function() {
				var f1 = new models.Fraction(3, 4);
				var f2 = new models.Fraction(3, 4);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(3, 2))).toBeTrue();
			});
		});

		describe('negative fractions', function() {
			it('can add negative fractions', function() {
				var f1 = new models.Fraction(-1, 4);
				var f2 = new models.Fraction(3, 4);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(1, 2))).toBeTrue();
			});

			it('can reduce a negative result', function() {
				var f1 = new models.Fraction(-4, 8);
				var f2 = new models.Fraction(2, 8);
				var sum = f1.plus(f2);
				expect(sum.equalsFraction(new models.Fraction(-1, 4))).toBeTrue();
			});
		});
	}
}