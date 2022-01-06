module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim

# What is output and why? What does this demonstrate about instance variables?

# nil is output. Even though Swimmable has been mixed in to Dog, enable_swimming
# has not been called on the Dog object to which teddy is assigned. This means
# that the state of @can_swim is not yet defined for that object, which
# translates to nil in Ruby for instance variables. This shows that instance
# variables default to nil if they have not yet been assigned a value
