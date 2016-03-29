component displayname='FractionsFactoryTest' extends='testbox.system.BaseSpec' {
	function beforeAll() {
		this.CUT = new models.Factory();
	}

	function run() {
		describe('fraction factory', function() {
			it('makes 0 in to a fraction', function() {
				var fraction = this.CUT.make(0);
				expect(fraction.equals(new models.Fraction(0))).toBeTrue();
			});

			it('makes any integer in to a fraction', function() {
				var fraction = this.CUT.make(3);
				expect(fraction.equals(new models.Fraction(3))).toBeTrue();
			});

			it('creates a non-trivial fraction', function() {
				var fraction = this.CUT.make(3, 4);
				expect(fraction.equals(new models.Fraction(3, 4))).toBeTrue();
			});

			it('reduces fractions when creating them', function() {
				var fraction = this.CUT.make(20, 15);
				expect(fraction.equals(new models.Fraction(4, 3))).toBeTrue();
			});
		});
	}
}