class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end


# What is output and why? How does this code demonstrate polymorphism?

# This code outputs:
#
# I eat.
# I eat plankton.
# I eat kibble.
#
# array_of_animals is assigned to an array containing Animal, Fish, and Dog
# objects. The each method is called on this array and passed a block, with one
# block parameter animal. The feed_animal method is passed each object from the
# array_of_animals array, which will call the eat method on each of those
# objects. Because each object has an eat method defined in its own class, there
# will be a different response to the same method call.
