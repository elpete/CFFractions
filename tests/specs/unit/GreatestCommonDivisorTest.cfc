component displayname='GreatestCommonDivisorTest' extends='testbox.system.BaseSpec' {
	function beforeAll() {
		variables.CUT = getMockBox().createMock('models.Fraction');
		makePublic(variables.CUT, 'gcd', 'publicGCD');
	}

	function run() {
		describe('greatest common divisor', function() {
			it('calculates the gcd for reflexive numbers', function() {
				expect(variables.CUT.publicGCD(1, 1)).toBe(1);
				expect(variables.CUT.publicGCD(2, 2)).toBe(2);
				expect(variables.CUT.publicGCD(-1, -1)).toBe(1);
			});

			it('calculates the gcd for relatively prime numbers', function() {
				expect(variables.CUT.publicGCD(2, 3)).toBe(1);
				expect(variables.CUT.publicGCD(4, 7)).toBe(1);
				expect(variables.CUT.publicGCD(-2, -3)).toBe(1);
			});

			it('calculates the gcd for where one number is a multiple of the other', function() {
				expect(variables.CUT.publicGCD(3, 9)).toBe(3);
				expect(variables.CUT.publicGCD(5, 30)).toBe(5);
			});

			it('calculates the gcd for where the two numbers have a common factor', function() {
				expect(variables.CUT.publicGCD(6, 8)).toBe(2);
				expect(variables.CUT.publicGCD(49, 315)).toBe(7);
				expect(variables.CUT.publicGCD(-24, -28)).toBe(4);
			});
		});
	}	
}