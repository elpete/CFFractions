component displayname='FractionsDivisionTest' extends='testbox.system.BaseSpec' {
	function run() {
		describe('compatibility with integers', function() {
			it('throws when dividing by zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(0);
				expect(function() {
					var quotient = f1.dividedBy(f2);
				}).toThrow();
			});

			it('throws when dividing non-zero by zero', function() {
				var f1 = new models.Fraction(3);
				var f2 = new models.Fraction(0);
				expect(function() {
					var quotient = f1.dividedBy(f2);
				}).toThrow();
			});

			it('can divide zero and non-zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(5);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(0))).toBeTrue();
			});

			it('can divide two non-zero, non-negative operands', function() {
				var f1 = new models.Fraction(4);
				var f2 = new models.Fraction(2);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(2))).toBeTrue();
			});

			it('can divide negative opearnds', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(-1);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(-2))).toBeTrue();
			});

			it('can get a negative output', function() {
				var f1 = new models.Fraction(-3);
				var f2 = new models.Fraction(1);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(-3))).toBeTrue();
			});
		});

		describe('fraction division', function() {
			it('can divide non-trivial, but equal denominators', function() {
				var f1 = new models.Fraction(1, 5);
				var f2 = new models.Fraction(2, 5);
				var quotient = f1.dividedBy(f2);
				expect(quotient.getNumerator()).toBe(1);
				expect(quotient.getDenominator()).toBe(2);
			});

			it('can divide non-trivial, non-equal denominators', function() {
				var f1 = new models.Fraction(1, 2);
				var f2 = new models.Fraction(3, 4);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(2, 3))).toBeTrue();
			});

			it('reduces the result even when the denominator is the same', function() {
				var f1 = new models.Fraction(3, 5);
				var f2 = new models.Fraction(4, 5);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(3, 4))).toBeTrue();
			});
		});

		describe('negative fractions', function() {
			it('can divide negative fractions', function() {
				var f1 = new models.Fraction(-1, 4);
				var f2 = new models.Fraction(3, 4);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(-1, 3))).toBeTrue();
			});

			it('can reduce a negative result', function() {
				var f1 = new models.Fraction(-4, 8);
				var f2 = new models.Fraction(2, 8);
				var quotient = f1.dividedBy(f2);
				expect(quotient.equalsFraction(new models.Fraction(-2))).toBeTrue();
			});
		});
	}
}