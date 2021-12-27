# Written Exam Practice Questions
---

## What is OOP? List all the benefits of OOP?

## What is encapsulation? How is this achieved in Ruby?

## What is polymorphism? What are the different ways to apply polymorphism in Ruby?

## What is duck typing?

## What is class inheritance? How does this work in Ruby?

## What is an object? What is a Class? What is a Module?

## What are the differences between classes and modules? How do you decide which to use?

## What is instantiation? Provide an example.

## What is the method lookup path? How is it important?

## How do we create an object in Ruby? Give an example of the creation of an object.

## What is a module? What is its purpose? How do we use them with our classes?

## Create a module for the class you created above and include it properly.

## What is a constructor? Provide an example.

## What is an instance variable? Provide an example.

## What is an instance method? Provide an example.

## What are getter and setter methods? Provide an example.

## What are accessor methods? Provide an example.

## What are class methods? Provide an example.

## What are class variables? Provide an example.

## What are constant variables? Provide an example.

## What's the difference between instance and class variables?

## What's the difference between instance and class methods?

## Why do custom classes usually define a to_s method?

## What is class inheritance? Provide an example.

## What is method overriding? Provide an example.

## When are Modules used? What is interface inheritance? What is multiple inheritance?

## What is namespacing? When is using namespacing beneficial?

## What is method access control?

## How are encapsulation and method access control related?

## What are the differences between public, private, and protected methods?

## What are collaborator objects? Why are they important in OOP?

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

In this code class `GoodDog` is defined, and on line 4 a new `GoodDog` is
instantiated by calling `new` on the `GoodDog` class. Local variable sparky is
assigned to the resulting object. This is an example of instantiating an
object from a class


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

In this code one module `Speak` and two classes, `GoodDog` and `HumanBeing` are
defined. The speak module has one instance method `speak`, which is defined with
one parameter `sound`. The method will output the object passed to it as a
variable using the `puts` method and will return `nil`.

The `Speak` module is mixed into `GoodDog` and `HumanBeing` using the `include`
keyword. This means that both `GoodDog` and `HumanBeing` objects have access to
the `Speak#speak` method, as demonstrated on lines 16 and 18. The `String`
objects passed to `speak` as arguments on both of those lines will be output and
`nil` will be returned.

This is an example of interface inheritance using mix-in modules.

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

In this example the same module and class names are used as in the previous
example, but the `Speak#speak` method is slightly different. Instead of being
passed `sound` as is, `puts` is now being passed a `String` object with the
object to which `sound` is assigned interpolated and passed in as an argument.
This will implicitly call the `to_s` method on `sound`.

On lines 15 and 16, `ancestors` is being called on `GoodDog` and `HumanBeing`.
`ancestors` will return the method lookup path for each of those classes. This
method lookup path will be output as it is passed to `puts` on lines 15 and 16.
For example, the method lookup path for `GoodDog` would be:

`[GoodDog, Speak, Object, Kernel, BasicObject]`

and for `HumanBeing`:

`[HumanBeing, Speak, Object, Kernel, BasicObject]`

This is an example of how to view the method lookup path for a class.

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

On line 7 of this code, a new `GoodDog` object is instantiated and sparky is
assigned to the resulting object. Upon instantiation, `GoodDog#initialize` is
automatically invoked. This means that the `puts` method call on line 3 of this
code is executed, outputting `This object was initialized!` to the console and
returning `nil`.

This is an example of a constructor method in action. Even though the return
value of the constructor method is `nil`, a new `GoodDog` object is still
instantiated.

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

This code is very similar to the last example, except that `GoodDog#initialize`
is defined differently. In this example it takes one parameter `name`. It takes
the object passed to it as an argument and assigns it to the `@name` isntance
variable. In this case, on line 7 `"Sparky"` is passed as an argument, so that
is what is assigned to `@name` when the new `GoodDog` object is created.

This is an example of a constructor method assinging value to an instance
variable upon instantiation of an object.

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

This code uses the same `GoodDog` class as the previous example, and adds to the
class definition one instance method `speak`. `GoodDog#speak` returns the
`String` object `Arf!`. On lines 11 and 13, new `GoodDog` objects are
instantiated and with `@names` `"Sparky"` and `"Fido"`.

This code will output `"Arf!"` twice and return `nil` due to the `puts` calls on
lines 12 and 14.

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

class DecoratorWhat is OOP? List all the benefits of OOP?
What is encapsulation? How is this achieved in Ruby?
What is polymorphism? What are the different ways to apply polymorphism in Ruby?
What is duck typing?
What is class inheritance? How does this work in Ruby?
What is an object? What is a Class? What is a Module?
What are the differences between classes and modules? How do you decide which to use?
What is instantiation? Provide an example.
What is the method lookup path? How is it important?
How do we create an object in Ruby? Give an example of the creation of an object.
What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created above and include it properly.
What is a constructor? Provide an example.
What is an instance variable? Provide an example.
What is an instance method? Provide an example.
What are getter and setter methods? Provide an example.
What are accessor methods? Provide an example.
What are class methods? Provide an example.
What are class variables? Provide an example.
What are constant variables? Provide an example.
What's the difference between instance and class variables?
What's the difference between instance and class methods?
Why do custom classes usually define a to_s method?
What is class inheritance? Provide an example.
What is method overriding? Provide an example.
When are Modules used? What is interface inheritance? What is multiple inheritance?
What is namespacing? When is using namespacing beneficial?
What is method access control?
How are encapsulation and method access control related?
What are the differences between public, private, and protected methods?
What are collaborator objects? Why are they important in OOP?
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
