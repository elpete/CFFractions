component displayname="Factory" {
	public Fraction function make(required numeric numerator, numeric denominator = 1) {
		return new Fraction(numerator, denominator);
	}
}