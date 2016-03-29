component displayname='FractionsMultiplyTest' extends='testbox.system.BaseSpec' {
	function run() {
		describe('compatibility with integers', function() {
			it('can multiply zero and zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(0);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(0))).toBeTrue();
			});

			it('can multiply non-zero and zero', function() {
				var f1 = new models.Fraction(3);
				var f2 = new models.Fraction(0);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(0))).toBeTrue();
			});

			it('can multiply zero and non-zero', function() {
				var f1 = new models.Fraction(0);
				var f2 = new models.Fraction(5);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(0))).toBeTrue();
			});

			it('can multiply two non-zero, non-negative operands', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(4);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(8))).toBeTrue();
			});

			it('can multiply negative opearnds', function() {
				var f1 = new models.Fraction(2);
				var f2 = new models.Fraction(-1);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(-2))).toBeTrue();
			});

			it('can get a negative output', function() {
				var f1 = new models.Fraction(-3);
				var f2 = new models.Fraction(1);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(-3))).toBeTrue();
			});
		});

		describe('fraction multiplication', function() {
			it('can multiply non-trivial, but equal denominators', function() {
				var f1 = new models.Fraction(1, 5);
				var f2 = new models.Fraction(2, 5);
				var product = f1.times(f2);
				expect(product.getNumerator()).toBe(2);
				expect(product.getDenominator()).toBe(25);
			});

			it('can multiply non-trivial, non-equal denominators', function() {
				var f1 = new models.Fraction(1, 2);
				var f2 = new models.Fraction(3, 4);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(3, 8))).toBeTrue();
			});

			it('reduces the result even when the denominator is the same', function() {
				var f1 = new models.Fraction(3, 5);
				var f2 = new models.Fraction(4, 6);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(6, 15))).toBeTrue();
			});
		});

		describe('negative fractions', function() {
			it('can multiply negative fractions', function() {
				var f1 = new models.Fraction(-1, 4);
				var f2 = new models.Fraction(3, 4);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(-3, 16))).toBeTrue();
			});

			it('can reduce a negative result', function() {
				var f1 = new models.Fraction(-4, 8);
				var f2 = new models.Fraction(2, 8);
				var product = f1.times(f2);
				expect(product.equals(new models.Fraction(-1, 8))).toBeTrue();
			});
		});
	}
}