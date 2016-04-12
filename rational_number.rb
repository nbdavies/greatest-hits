class RationalNumber
  attr_reader :numerator, :denominator
  
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
    reduce
  end

  def reduce
    # If the denominator is negative, multiply both by -1
    if self.denominator < 0 
      @numerator *= -1
      @denominator *= -1
    end
    minimum = [self.numerator.abs, self.denominator].min
    (2..minimum).each do |factor|
      until self.numerator % factor != 0 or self.denominator % factor != 0 do
        @numerator /= factor
        @denominator /= factor
      end
    end
  end
  
  # For (a/b) and (c/d)...

  # Addition
  # (a*d + b*c) / b*d (and then reduce)
  def +(rational)
    new_numerator = self.numerator * rational.denominator + self.denominator * rational.numerator
    new_denominator = self.denominator * rational.denominator
    RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Subtraction
  # (a*d - b*c) / b*d (and then reduce)
  def -(rational)
    new_numerator = self.numerator * rational.denominator - self.denominator * rational.numerator
    new_denominator = self.denominator * rational.denominator
    RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Multiplication
  # a*c / b*d (and then reduce)
  def *(rational)
    new_numerator = self.numerator * rational.numerator
    new_denominator = self.denominator * rational.denominator
    RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Division
  # a*d / b*c (and then reduce)
  def /(rational)
    new_numerator = self.numerator * rational.denominator
    new_denominator = self.denominator * rational.numerator
    RationalNumber.new(new_numerator, new_denominator)
  end
  
  # Exponentiation
  # a**i / b**i (shouldn't need to reduce)
  def **(integer)
    RationalNumber.new(self.numerator ** integer, self.denominator ** integer)
  end
  
  # The reciprocal, with an example
  # (1/1 / self) or (b / a) (shouldn't need to reduce)
  def reciprocal
    RationalNumber.new(self.denominator, self.numerator)
  end
  
  # For, e.g., 1/3 should return -1/3
  # That is, rat + rat.inverse == RationalNumber(0,1)
  # -a / b (shouldn't need to reduce)
  def inverse
    RationalNumber.new(-self.numerator, self.denominator)
  end
  
  # Returns true if this rational is equal the the input
  # RationalNumber.new(1,2) == RationalNumber(2,4)
  # a*d == b*c
  def ==(rational)
    self.numerator * rational.denominator == self.denominator * rational.numerator
  end
  
  def to_s
    "(#{self.numerator}/#{self.denominator})"
  end
end