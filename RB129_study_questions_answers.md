## Written Exam Practice Questions

1. What is OOP? List all the benefits of OOP?

2. What is encapsulation? How is this achieved in Ruby?

3. What is polymorphism? What are the different ways to apply polymorphism in Ruby?

4. What is duck typing?

5. What is class inheritance? How does this work in Ruby?

6. What is an object? What is a Class? What is a Module?

7. What are the differences between classes and modules? How do you decide which to use?

8. What is instantiation? Provide an example.

9. What is the method lookup path? How is it important?

10. How do we create an object in Ruby? Give an example of the creation of an object.

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

On lines 1-2 a new class `GoodDog` is defined. On line 4 local variable `sparky`
is assigned to the return value of calling `new` on the `GoodDog` class, which
is a new `GoodDog` object.

This is an example of creating an instance of a class.
  
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

In this code, a module `Speak` is defined along with two classes, `GoodDog` and
`HumanBeing`. The `Speak` module contains one instance method `speak`. The
`Speak` module is mixed into `GoodDog` and `HumanBeing` using the `include`
keyword, giving both of those classes access to `Speak#speak`. This is shown on
lines 16 and 18 when `speak` is called on `sparky` and `bob`, `GoodDog` and
`HumanBeing` objects respectively. The program will output the `String` objects
passed to `speak` as arguments.

This is an example of interface inheritance using mix in modules.

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

In this code one module and two classes are defined using the same names as in
the last example. `Speak#speak` is slightly different here however; rather than
being passed whatever `speak` receives as an argument, `puts` is passed a `String`
object with the argument interpolated into it.

On lines 15 and 16 `ancestors` is called on the `GoodDog` and `HumanBeing`
classes. This will return the method lookup path for each of those classes. That
return value is then passed to `puts` as an argument. Therefore, the method
lookup paths for both of those classes is output to the console:

```
[GoodDog, Speak, Object, Kernel, BasicObject]
[HumanBeing, Speak, Object, Kernel, BasicObject]
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

When `new` is called on the `GoodDog` class, `GoodDog#initialize` will be
invoked automatically. This will output `This object was initialized!` and
return `nil`. `sparky` will still be assigned to a new `GoodDog` object.

This is an example of a constructor method being invoked upon the instantiation
of an object from a class.

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

This code is similar to the last one, but in this case `GoodDog#initialize`
is defined with one parameter `name`. It assigns the instance variable `@name`
to the object which is passed in as an argument, in this case a `String` object
`Sparky`.

This is an example of a constructor method defining the state of an instance of
a class upon instantiation.

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

This code instantiates objects of the `GoodDog` class the same was as in the
last example. Here, the return value of `GoodDog#speak` being called on each
`GoodDog` object is passed to `puts`. This will output the return value of that
`speak` method call and return `nil`. In this case, both `puts` calls will
output `Arf!`, as that is what `GoodDog#speak` returns.

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

This method is similar to the last, except this time `GoodDog#speak` will
interpolate the value to which `@name` is assigned into its return value, which
is passed to `puts`. Therefore, the code will output:

```
Sparky says arf!
Fido says arf!
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

In this example an object of the `GoodDog` class is instantiated with its
`@name` assigned to `"Sparky"`. On line 2, the `attr_accessor` shorthand is used
to create getter and setter methods for the instance variables `@name`,
`@height`, and `@weight`. Since these are public, both `GoodDog#name` and
`GoodDog#name=` are available outside of the `GoodDog` class. This means that on
line 14 `GoodDog#name` can be called on `sparky` and will return the value to
which `@name` is assigned for that instance of the `GoodDog` class.
`GoodDog#name=` is also available, which means that on line 15 `@name` will be
reassigned to `"Spartacus"`. This code will output the following:

```
Sparky says arf!
Sparky
Spartacus
```

This is an example of interacting with the public interface of an object, and
using `attr_*` to create getter and setter methods

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

The difference between these two examples is that in the first, the `@name`
instance variable is being directly referenced in `speak`, while in the second
example the `name` method is being called. If the `name` method has been defined
in the class to return the value to which `@name` is assigned, the two will have
the same return value.

---

10.
```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```

This is an example of an instance method definition. It calls the setter methods
for each attribute `@name`, `@height`, and `@weight` and passes them the
corresponding argument which `change_info` received. If those setter methods
have been defined, this will reassign those attributes to the values passed into
`change_info` as arguments.

---

11.
```ruby
# ... rest of code ommitted for brevity

def self.what_am_i
  "I'm a GoodDog class!"
end

GoodDog.what_am_i   # => ?
```

This code will return a `String` object `"I'm a GoodDog class!"` and will not
output anything, as there is no method call present which will output anything.

This is an example of defining a class method in Ruby.

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

In this example a `GoodDog` class is defined with a constructor `initialize`
method which will increment the class variable `@@number_of_dogs` (which is
initially assigned to `0`) by `1` every time an object of the class is
instantiated. A class method `total_number_of_dogs` is also defined (by
prepending `self` to the method name) which returns the value to which
`@@number_of_dogs` is assigned.

In the code following the class definition, `total_number_of_dogs` is called on
`GoodDog`, and that return value is passed to `puts`. Then, two objects of the
`GoodDog` class are instantiated. This will automatically increment
`@@number_of_dogs` by `1` each time. Then, `total_number_of_dogs` is called on
`GoodDog` once again, and that return value is passed to `puts`. The code will
output:

```
0
2
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

In this code, a `GoodDog` class is defined. It is defined with a constant
`DOG_YEARS`, which is assigned to the value `7`. The `attr_accessor` shorthand
is used to create getter and setter methods for the instance variables `@name`
and `@age`. `GoodDog#initialize`, which is invoked automatically upon
instantiation of a new `GoodDog` object, is defined with two parameters, `n` and
`a`. On line 7, `GoodDog#name=` is called using an explicit `self` caller in
order to disambiguate calling `GoodDog#name=` from declaring a local variable
`name`. This method is passed `n` as an argument, thus assigning `@name` to that
value. On the next line, `GoodDog#age=` is called the same way. This assigns
`@age` to the return value of `a` times `DOG_YEARS`, which in the case of this
code is `28`.

This code will output `28`, and is an example of using `self` to disambiguate
calling a setter method from creating a local variable of the same name.

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

In this code a new `GoodDog` object would be instantiated in the same way as the
last example. However, in this example since `sparky` is not assigned any value
until it is passed to `puts` as an argument this code will raise a `NameError`.
If `sparky` were to be a assigned to a `GoodDog` by calling
`GoodDog.new("Sparky", 4)`, then passing `puts` `sparky` as an argument would
output `This dog's name is Sparky and it is 28 in dog years.` due to the
implementation of `GoodDog#to_s`. This overrides any `to_s` method definition
further up the method lookup path, and will return the `String` object in the
`GoodDog#to_s` definition.

This is an example of method overriding.

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

The first self is referring to whatever current instance of the `GoodDog` class
that `what_is_self` is called on. The second and third are both referring the
the `GoodDog` class itself.

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

In this code a class `Animal` is defined with one instance method `speak`.
`Animal#speak` returns a `String` object `"Hello!"`. Two more classes are
defined, `GoodDog` and `Cat`, both of which are subclasses of `Animal`. Neither
of them contain a `speak` instance method. However, on lines 15 and 16 when
`speak` is called on a `GoodDog` and `Cat` object and passed to `puts`, `Hello!`
will be output. This is an example of subclasses inheriting behaviors (methods,
or interface) from their superclass.

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

This is similar to the last example in that the same classes and inheritance
structure is defined. However, in this example the `GoodDog` class is defined
with its own `initialize` method which overrides `Animal#initialize`, and its
own `speak` method which overrides `Animal#speak`. `Cat` still inherits the same
methods from `Animal` as in the last example, which means the output is the same
for the last line. However, when `speak` is called on a `GoodDog` object with a
`@name` of `Sparky` and passed to `puts`, `Sparky says arf!` will be output.

This is an example of polymorphism, the ability for objects of different types
to respond to a common inteface.

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

In this code a class `Animal` is defined with one instance method `speak`, which
returns a `String` object `Hello`. Another class `GoodDog` is defined which
subclasses from `Animal` and has one instance method `speak`. `GoodDog#speak`
overrides `Animal` speak when called on a `GoodDog` object. Because
`GoodDog#speak` contains the keyword `super`, Ruby will look up the method
lookup path for another method named `speak`. When it hits `Animal#speak`, it
will use that return value and concatenate the rest of `GoodDog#speak`.

This code will return `"Hello! from GoodDog class"` and have no output, and is
an example of using `super` to call a method from higher up in the method lookup
path.

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

In this example a class `Animal` and a class `BadDog`, which subclasses from
`Animal` are defined. When a `BadDog` object is instantiated,
`BadDog#initialize` is passed two arguments, `2` and `'bear'`. Inside of
`BadDog#initialize`, super is passed as an argument the value assigned to
`name`, which in this case is `"bear"`. `Animal#initialize` will assign `@name`
to `"bear"`, which will be inherited by the new `BadDog` object being
instantiated. `BadDog#initialize` will then assign `@age` to the value passed in
as an argument for the `age` parameter, in this case `2`.

This is an example of using `super` to invoke a superclass's constructor method
while instantiating an object of its subclass.

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
