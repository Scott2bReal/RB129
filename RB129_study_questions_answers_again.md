# Written Exam Practice Questions
---

1. What is OOP? List all the benefits of OOP?

Object Oriented Programming (OOP) is a way of organizing code in a way which
facilitates more complexity and abstraction. It is implemented through the use
of classes to create objects, which in turns allows for encapsulation and
polymorphism.

2. What is encapsulation? How is this achieved in Ruby?

Encapsulation is the practice of partitioning portions of a code base into
distinct parts, with the implementation of those parts being hidden from each
other. The parts are connected by their public interfaces, which can be designed
by the programmer. It is achieved in ruby through the creation of objects.

3. What is polymorphism? What are the different ways to apply polymorphism in Ruby?

Polymorphism is the ability for different types of objects to respond to a
common interface. Two ways to achieve polymorphism in Ruby are through duck
typing and class inheritance.

4. What is duck typing?

Duck typing is when objects of different types respond to a method call with the
same name and same number of arguments.

```ruby
class Dog
  def talk
    puts "Bark!"
  end
end

class Cat
  def talk
    puts "Meow!"
  end
end

dog = Dog.new
cat = Cat.new
dog.talk # => "Bark!"
cat.talk # => "Meow!"
```

5. What is class inheritance? How does this work in Ruby?

Class inheritance is the practice of passing down behaviors from a superclass to
a subclass. A superclass can have a behavior defined, and if an object of the
subclass is asked to perform that behavior, it will be able to. For example:

```ruby
class Animal
  def eat
    puts "Yum!"
  end
end

class Dog < Animal; end
class Cat < Animal; end

dog = Dog.new
cat = Cat.new
dog.eat # => "Yum!"
cat.eat # => "Yum!"
```

6. What is an object? What is a Class? What is a Module?

<<<<<<< HEAD
An object is an instance of a class. A class is like a blueprint used to define
the behaviors and attributes available to objects created with that blueprint. A
module is a way to group related behaviors and classes under one namespace.

7. What are the differences between classes and modules? How do you decide which to use?

A main difference between classes and modules is that classes can be used to
instantiate objects, while modules cannot. Another major difference is that a
class can only inherit from a single superclass, but may inherit behaviors from
any number of modules. The decision of which to use is based on the
relationships involved. If something has a "has a" relationship, then a module
will be best. On the other hand, if something has an "is a" relationship, then a
class is the way to go.

8. What is instantiation? Provide an example.

Instantiation is the act of creating an object using a class. An example of
instantiation is as follows:

```ruby
class Dog; end

dog = Dog.new
p dog # => #<Dog:0x00007fc3bb9a5bd8> 
```
=======
An object is an instance of a class. A class is a sort of blueprint which
describes attributes and behaviors available to objects created using that
blueprint. A module is a way to group behaviors and/or classes into a single
namespace, which can be "mixed-in" to classes.

7. What are the differences between classes and modules? How do you decide which to use?

One main difference between a class and a module is that a class can be used to
instantiate objects, which a module cannot. Another difference is that a class
may only subclass from one superclass (in Ruby), while many modules can be mixed
into a single class. A useful method to decide which to use is to examine the
type of relationship between concepts: a "has a" relationship would suggest
using a module, whereas an "is a" relationship would suggest class inheritance.

8. What is instantiation? Provide an example.

Instantiation 
>>>>>>> 043eb3238c4422031dfa122fb71f5c89402e10ce

9. What is the method lookup path? How is it important?

The method lookup path describes the places (classes and/or modules) Ruby will
search for a method of a given name, and the order in which it will examine
those places. It is important because it shows us where Ruby is looking for a
method, and if not understood properly can lead to unintended behaviors. 

10. How do we create an object in Ruby? Give an example of the creation of an object.

We create an object in Ruby by calling the `new` method on a class. This will
automatically invoke the `#initialize` instance method if one exists, so it must
be passed the proper number of arguments. Here is an example of creation of an
object in Ruby.

```ruby
class Dog; end

dog = Dog.new
p dog # => #<Dog:0x00007fc3bb9a5bd8> 
```

11. What is a module? What is its purpose? How do we use them with our classes?

12. Create a module for the class you created above and include it properly.

13. What is a constructor? Provide an example.

14. What is an instance variable? Provide an example.

15. What is an instance method? Provide an example.

16. What are getter and setter methods? Provide an example.

17. What are accessor methods? Provide an example.

18. What are class methods? Provide an example.

19. What are class variables? Provide an example.

20. What are constant variables? Provide an example.

21. What's the difference between instance and class variables?

22. What's the difference between instance and class methods?

23. Why do custom classes usually define a to_s method?

24. What is class inheritance? Provide an example.

25. What is method overriding? Provide an example.

26. When are Modules used? What is interface inheritance? What is multiple inheritance?

27. What is namespacing? When is using namespacing beneficial?

28. What is method access control?

29. How are encapsulation and method access control related?

30. What are the differences between public, private, and protected methods?

31. What are collaborator objects? Why are they important in OOP?

---

# Written Exam Practice Code Snippets


## Explain the code / what is it an example of? / what is the output?

---

1.
```ruby
class GoodDog
end

sparky = GoodDog.new  
```
  
---

2.
```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")   # => ?
bob = HumanBeing.new
bob.speak("Hello!")   # => ?
```

---

3.
```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts GoodDog.ancestors   # => ?
puts HumanBeing.ancestors   # => ?
```

---

4.
```ruby
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new   # => ?
```

---

5.
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```

---

6.
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak   # => ?
fido = GoodDog.new("Fido")
puts fido.speak   # => ?
```

---

7.
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak   # => ?
fido = GoodDog.new("Fido")
puts fido.speak   # => ?
```

---

8.
```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak   # => ?
puts sparky.name   # => ?
sparky.name = "Spartacus"
puts sparky.name   # => ?
```

---

9.
What is the difference between the two?
```ruby
def speak
  "#{@name} says arf!"
end

def speak
  "#{name} says arf!"
end
```

---

10.
```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

---

11.
```ruby
# ... rest of code ommitted for brevity

def self.what_am_i
  "I'm a GoodDog class!"
end

GoodDog.what_am_i   # => ?
```

---

12.
```ruby
class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => ?

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => ?
```

---

13.
```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => ?
```

---

14.
```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

puts sparky      # => ?
```

---

15.
What do the different `self`s refer to?

```ruby
class GoodDog
  # ... rest of code omitted for brevity

  def what_is_self
    self
  end

  def self.this_is_a_class_method
  end

  puts self
end
```

---

16.
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak           # => ?
puts paws.speak             # => ?
```

---

17.
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => ?
puts paws.speak             # => ?
```

---

18.
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => ?
```

---

19.
```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")    # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```

---

20.
```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => ?
neemo.swim                  # => ?
paws.swim                   # => ?
```

---

21.
```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

puts Animal.ancestors    # => ?
```

---

22.
```ruby

class Animal
  include Walkable
end

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts GoodDog.ancestors    # => ?
```

---

23.
```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```

---

24.
```ruby
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "IDK, I'm protected!"
  end
end

fido = Animal.new
fido.a_public_method        # => ?
```

---

25.
```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end
```

---

26.
```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
bob.pet.fetch                 # => "fetching!"
```

---
