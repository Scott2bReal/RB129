class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels # => 4

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels # => 2
p Vehicle.wheels    # => 2

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels
# All output 2

# What does the code above output, and why? What does this demonstrate about
# class variables, and why we should avoid using class variables when working
# with inheritance?

# This shows that class variables in a subclass with the same name as class
# variables from the superclass will override the superclass variables. We
# should avoid using them when working with inheritance because of this
# unintuitive behavior. It could cause unintended consequences.
