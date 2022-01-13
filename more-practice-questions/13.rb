class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

# What is output and why?

# bark! bark!  bark! bark!
#
# is output. Because teddy is assigned to a new Dog object, Dog#initialize is
# invoked when creating that new Dog object. Dog#initialize is defined with one
# parameter name. Unlike Animal#initialize, the string "Teddy" passed as an
# argument to Dog#initialize is never utilized in the method definition, meaning
# the @name instance variable has a value of nil when it is referenced in
# Dog#dog_name. The Dog#initialize method can be removed from the Dog class, as
# it will then inherit Animal#initialize which will cause the code to behave as
# expected.
