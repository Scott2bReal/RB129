class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    [self, other_class]
  end

  # def +(other_class)
  #   animals + other_class.animals
  # end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes


# What is output? Is this what we would expect when using `AnimalClass#+`? If
# not, how could we adjust the implementation of `AnimalClass#+` to be more in
# line with what we'd expect the method to return?

# p some_animal_classes will output an array containing all of the Animal
# objects contained in mammals and birds. A better implementation of
# AnimalClass#+ that would behave more as expected is included in the code,
# with the original version commented out. AnimalClass#+ will now return an
# array containing both of the objects involved in the method call
