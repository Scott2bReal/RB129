class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # Add this method
  def ==(other_person)
    name == other_person.name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')

p al == alex # => true

# In the code above, we want to compare whether the two objects have the same
# name. `Line 11` currently returns `false`. How could we return `true` on `line
# 11`? 

# Further, since `al.name == alex.name` returns `true`, does this mean the
# `String` objects referenced by `al` and `alex`'s `@name` instance variables
# are the same object? How could we prove our case?

# A good way to get this code to return true on line 11 would be to define a
# custom Person#== method which will evaluate just the @name attribute of two
# Person objects. Just because this will return true does not mean the objects
# are the same, however. This is easily shown by calling the object_id method on
# both objects. While al == alex will return true, those two objects have
# different object IDs.
