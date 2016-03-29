component displayname='Fraction' {

	property type='numeric' name='numerator';
	property type='numeric' name='denominator';

	public Fraction function init(required numeric numerator, numeric denominator = 1) {
		guardAgainstZeroDenominator(arguments.denominator);
		local.signOfDenominator = arguments.denominator < 0 ? -1 : 1;
		local.gcd = variables.gcd(arguments.numerator, arguments.denominator) * signOfDenominator;
		variables.numerator = arguments.numerator / local.gcd;
		variables.denominator = arguments.denominator / local.gcd;

		return this;
	}

	public Fraction function plus(required Fraction that) {
		return new Fraction(
			numerator = this.getNumerator() * that.getDenominator() + that.getNumerator() * this.getDenominator(),
			denominator = this.getDenominator() * that.getDenominator()
		);
	}

	public Fraction function minus(required Fraction that) {
		return new Fraction(
			numerator = this.getNumerator() * that.getDenominator() - that.getNumerator() * this.getDenominator(),
			denominator = this.getDenominator() * that.getDenominator()
		);
	}

	public Fraction function times(required Fraction that) {
		return new Fraction(
			numerator = this.getNumerator() * that.getNumerator(),
			denominator = this.getDenominator() * that.getDenominator()
		);
	}

	public Fraction function dividedBy(required Fraction that) {
		return new Fraction(
			numerator = this.getNumerator() * that.getDenominator(),
			denominator = this.getDenominator() * that.getNumerator()
		);
	}

	public numeric function getNumerator() {
		return variables.numerator;
	}

	public numeric function getDenominator() {
		return variables.denominator;
	}

	public boolean function equals(required Fraction that) {
		return this.getNumerator() == that.getNumerator() &&
			this.getDenominator() == that.getDenominator();
	}

	private void function guardAgainstZeroDenominator(required numeric denominator) {
		if (arguments.denominator == 0) {
			throw("Cannot have 0 in the denominator.")
		}
	}

	private numeric function gcd(required numeric a, required numeric b) {
		while (b != 0) {
			var t = b;
			b = a % t;
			a = t;
		}
		return abs(a);
	}

	public string function toString() {
		return "#getNumerator()#/#getDenominator()#";
	}
}