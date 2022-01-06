class Animal
  def initialize; end
end

class Bear < Animal
  def initialize(color)
    # super
    @color = color
  end
end

bear = Bear.new('black')
p bear

# What is output and why? What does this demonstrate about `super`?

# An ArgumentError is raised with this code, because super automatically passes
# an argument to Animal#initialize, which is not expecting any arguments. This
# can be avoided by making the change indicated in the above code (removing
# super).
