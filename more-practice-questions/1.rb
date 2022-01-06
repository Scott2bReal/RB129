class Person
  attr_reader :name

  def set_name
    @name = "Bob"
  end
end

bob = Person.new
p bob.name

# What is output and why? What does this demonstrate about instance variables
# that differentiates them from local variables?

# nil is output. This is because @name is referenced on line 5, but that line
# has not been executed by the time bob.name is passed to p. If @name had been a
# local variable that had not been assigned yet, the program would have thrown
# an error and terminated. This demonstrates one difference between local
# variables and instance variables; when an instance variable is declared, that
# reference is stored in memory and assigned to nil, even if the variable has
# not yet been assigned a value. Local variables, on the other hand, will not be
# stored in memory until assignment occurs
