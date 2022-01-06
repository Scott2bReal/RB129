class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno

# What is output and why? What does this demonstrate about `super`?

# The GoodDog object with @name brown and @color brown is output. This shows
# that super called in an initialize method will automatically pass any
# arguments to the superclass initialize method unless arguments are
# specifically passed.

