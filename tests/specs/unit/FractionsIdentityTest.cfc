component displayname='FractionsIdentityTest' extends='testbox.system.BaseSpec' {
	function run() {
		describe('fraction properties', function() {
			it('cannot instantiate a fraction with a zero denominator', function() {
				expect(function() {
					new models.Fraction(4, 0);
				}).toThrow();
			});

			it('moves the negative sign to the numerator', function() {
				var fraction = new models.Fraction(1, -4);
				expect(fraction.equalsFraction(new models.Fraction(-1, 4))).toBeTrue();
			});

			it('converts both negative numerators and denominators to positive fractions', function() {
				var fraction = new models.Fraction(-3, -7);
				expect(fraction.equalsFraction(new models.Fraction(3, 7))).toBeTrue();
			});

			it('outputs a nice format with `toString()`', function() {
				var fraction = new models.Fraction(3, 4);
				expect(fraction.toString()).toBe('3/4');
			});
		});
	}
}