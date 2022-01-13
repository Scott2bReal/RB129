class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name


# What is output on `lines 14, 15, and 16` and why?

# Those lines will output:
# Bob
# My name is BOB
# BOB

# This is because the upcase! method is called in Person#to_s. When the puts
# method is called and passed the the Person object to which bob is assigned,
# puts will implicitly invoke Person#to_s on the String object to which @name is
# assigned. This will mutate that string object to contain all upcased
# characters, so that when the name getter method is called on bob once again,
# the String object to which @name is assigned is now BOB
