class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

# bob.pets.jump
bob.pets.each(&:jump)

# We raise an error in the code above. Why? What do `kitty` and `bud` represent
# in relation to our `Person` object?

# 'kitty' and 'bud' are stored in the array to which @pets instance variable is
# assigned. On the final line, the jump method is called on pets, which means it
# is being called on an array. It seems like the code is meant to have the
# supplied final line (original commented out). kitty and bud are collaborator
# objects which are stored in the @pets attribute
