component displayname="FractionsEqualTest" extends="testbox.system.BaseSpec" {
	function run() {
		describe('fraction equality', function() {
			it('is equal if they have the same numerator and denominator', function() {
				var f1 = new models.Fraction(3, 5);
				var f2 = new models.Fraction(3, 5);
				expect(f1.equalsFraction(f2)).toBeTrue();
			});

			it('is not equal if they have different numerators', function() {				
				var f1 = new models.Fraction(1, 5);
				var f2 = new models.Fraction(2, 5);
				expect(f1.equalsFraction(f2)).toBeFalse();
			});

			it('is not equal if they have different denominators', function() {
				var f1 = new models.Fraction(3, 4);
				var f2 = new models.Fraction(3, 7);
				expect(f1.equalsFraction(f2)).toBeFalse();
			});

			it('is equal with a whole number and the same fraction representation', function() {
				var f1 = new models.Fraction(5, 1);
				var f2 = new models.Fraction(5);
				expect(f1.equalsFraction(f2)).toBeTrue();
			});

			it('it is not equal with two different whole numbers', function() {
				var f1 = new models.Fraction(3);
				var f2 = new models.Fraction(9);
				expect(f1.equalsFraction(f2)).toBeFalse();
			});
		});

		describe('reducing fractions', function() {
			xit("is equal even if the fractions aren't fully reduced", function() {
				var f1 = new models.Fraction(3, 4);
				var f2 = new models.Fraction(6, 8);
				expect(f1.equalsFraction(f2)).toBeTrue();
			});
		});
	}
}