module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape

# What is output and why? What does this demonstrate about constant scope? What
# does `self` refer to in each of the 3 methods above?
#
# 4
# 4
# is output, and then an error is thrown. This demonstrates that constants
# assigned in a superclass are available to a subclass without direct reference,
# but must be specifically referenced in a module. In the three methods with
# self, it is referring to;
#
# Describable#describe_shape: whatever object the method is called on
# Shape.sides: The class Shape
# Shape#sides: The current instance of the Shape class
