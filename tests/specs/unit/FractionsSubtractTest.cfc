component displayname='FractionsSubtractTest' extends='testbox.system.BaseSpec' {
	function run() {
		describe('compatibility with integers', function() {
			it('can subtract zero and zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(0);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(0))).toBeTrue();
			});

			it('can subtract non-zero and zero', function() {
				var f1 = new models.Fraction(3);
				var f2 = new models.Fraction(0);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(3))).toBeTrue();
			});

			it('can subtract zero and non-zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(5);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(-5))).toBeTrue();
			});

			it('can subtract two non-zero, non-negative operands', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(4);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(-2))).toBeTrue();
			});

			it('can subtract negative opearnds', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(-1);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(3))).toBeTrue();
			});

			it('can get a negative output', function() {
				var f1 = new models.Fraction(-3);
				var f2 = new models.Fraction(1);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(-4))).toBeTrue();
			});
		});

		describe('fraction subtraction', function() {
			it('can subtract non-trivial, but equal denominators', function() {
				var f1 = new models.Fraction(1, 5);
				var f2 = new models.Fraction(2, 5);
				var difference = f1.minus(f2);
				expect(difference.getNumerator()).toBe(-1);
				expect(difference.getDenominator()).toBe(5);
			});

			it('can subtract non-trivial, non-equal denominators', function() {
				var f1 = new models.Fraction(3, 4);
				var f2 = new models.Fraction(1, 2);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(1, 4))).toBeTrue();
			});

			it('reduces the result even when the denominator is the same', function() {
				var f1 = new models.Fraction(7, 8);
				var f2 = new models.Fraction(3, 8);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(1, 2))).toBeTrue();
			});
		});

		describe('negative fractions', function() {
			it('can subtract negative fractions', function() {
				var f1 = new models.Fraction(-1, 4);
				var f2 = new models.Fraction(3, 4);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(-1))).toBeTrue();
			});

			it('can reduce a negative result', function() {
				var f1 = new models.Fraction(-4, 8);
				var f2 = new models.Fraction(2, 8);
				var difference = f1.minus(f2);
				expect(difference.equals(new models.Fraction(-3, 4))).toBeTrue();
			});
		});
	}
}