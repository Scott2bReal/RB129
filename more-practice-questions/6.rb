class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    # name = name.upcase
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise
# an error. Why? How could we adjust this code to output `'BOB'`?

# This code raises an error because, again, the setter method is not being
# called in change_name. Instead, a new local variable name is initialized, and
# attempted to be assigned to itself. This raises an error because it has been
# assigned no value previously. This could be fixed by prepending self to the
# first name reference in change_name
