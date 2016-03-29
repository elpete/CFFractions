component displayname='FractionsReduceTest' extends='testbox.system.BaseSpec' {
	function run() {
		describe('reducing fractions', function() {
			it("doesn't reduce fractions already in lowest terms", function() {
				var fraction = new models.Fraction(3, 4);
				expect(fraction.getNumerator()).toBe(3);
				expect(fraction.getDenominator()).toBe(4);
			});

			it('reduces fractions to anything but one', function() {
				var fraction = new models.Fraction(6, 9);
				expect(fraction.getNumerator()).toBe(2);
				expect(fraction.getDenominator()).toBe(3);				
			});

			it('reduces fractions to whole numbers', function() {
				var fraction = new models.Fraction(8, 4);
				expect(fraction.getNumerator()).toBe(2);
			});
		});
	}
}