## Written Exam Practice Questions

1. What is OOP? List all the benefits of OOP?

    Object Oriented Programming (OOP) is a way of organizing and abstracting
    concepts in order to facilitate more complex, flexible, and easily
    maintainable code. It is achieved through the use of concepts such as
    encapsulation, polymorphism, and inheritance.

2. What is encapsulation? How is this achieved in Ruby?

    Encapsulation is the concept of partitioning the data and functions of a
    program into distinct parts which are made unavailable to each other. This
    is done in order to fcilitate more complex programming, in which small
    pieces of independent functionality or data can interact with each other. In
    Ruby, encapsulation is achieved by creating **objects**. Objects are given
    real-world noun names have methods whose names describe their behavior.
    Encapsulation is involved in controlling and defining the ways in which
    users of a program interact with it.

3. What is polymorphism? What are the different ways to apply polymorphism in Ruby?

   Polymorphism is the possiblility of multiple different data types to respond
   to a common interface. Many different object types can respond to a method
   with the same name. It is often achieved via inheritance, but is not
   necessary.

4. What is duck typing?

    Duck typing is when different object types share the same method name
    between them and the methods take the same number of arguments.

5. What is class inheritance? How does this work in Ruby?

    Class inheritance in Ruby is the ability for a class subclass from another
    class. The class which is being subclassed from is called the superclass.
    The subclass will take on attributes and behaviors from the superclass.
    Methods in the subclass with the same name as those in the superclass will
    override the superclass methods. Classes can only subclass from one
    superclass (single inheritance)

6. What is an object? What is a Class? What is a Module?

    An object is an instance of a class. A class is like a blueprint for
    creating objects, that outlines the attributes and behaviors of objects
    created. A module is a way to group behaviors and classes into a single
    namespace. Objects cannot be instantiated directly from a module, but
    modules can contain classes, from which objects may be instantiated. Modules
    can be mixed into classes using the `include` keyword. When modules are
    mixed into classes, instances (objects) of that class will have access to
    the behaviors from the module (interface inheritance)

7. What are the differences between classes and modules? How do you decide which to use?

    Objects can be instantiated from classes, while they cannot be instantiated
    from modules. A class may only inherit from one single superclass, but an
    unlimited number of modules can be mixed into a class. Deciding which to use
    can be tricky, but a handy way to make that decision is by evaluating the
    relationship between things, and looking for a "has-a" or an "is-a"
    relationship. For example, if something "is an" animal, then a class
    `Animal` would be appropriate. If something "has an" ability to swim, then
    it would make sense to go with a module `Swimmable`.

8. What is instantiation? Provide an example.

    Instantiation is the creation of an object using the blueprint provided by a
    class definition. Each instance of a class is assigned a unique object ID.
    Calling `new` on a class will instantiate an object of that class. Here is
    an example of instantiating an object from a basic class:
    
    ```ruby
    class Foo
      def initialize
        @name = 'Bar'
      end
    end
    
    thing = Foo.new # An object is instantiated.
    p thing         # => #<Foo:0x00007f25b807ff00 @name="Bar">   
    ```

9. What is the method lookup path? How is it important?

    The method lookup path is the order in which Ruby will check classes and
    modules to find a method which has been called. It starts in the class from
    which the calling object is instantiated, and will continue up the the
    inheritance tree, starting with the most recently included modules and
    moving up from there. The method lookup path can be examined by calling
    `ancestors` on a class. It is important because it shows us where Ruby is
    looking for a method, and if it is not understood it can lead to accidental
    method overriding.

10. How do we create an object in Ruby? Give an example of the creation of an object.

    This is the same as question number 8

11. What is a module? What is its purpose? How do we use them with our classes?

    A module is a way to group behaviors and even classes under one namespace.
    A module's purpose is to organize related classes and behaviors. They can
    also be used as "containers", to store methods otherwhise out-of-place in an
    application. The are "mixed-in" to classes using the `include` keyword.

12. Create a module for the class you created above and include it properly.

    ```ruby
    module Doable
      def what_are_we_doing
        "It!"
      end
    end
    
    class Foo
      include Doable
      
      def initialize
        @name = 'Bar'
      end
    end
    
    thing = Foo.new
    puts thing.what_are_we_doing # => "It!"
    ```


13. What is a constructor? Provide an example.

    A constructor is a method which instantiates an object of a class. In Ruby,
    the `new` method acts as a constructor, which will create a new object of a
    class and call that class's `initialize` method automatically if one exists.
    For example:
    
    ```ruby
    class Thing
      def initialize(name) # Invoked upon instantiation of an object.
        @name = name 
      end
    end
    
    thing = Thing.new("thing") # The constructor is called
    p thing # => #<Thing:0x00007f086e291418 @name="thing">   
    ```

14. What is an instance variable? Provide an example.

    An instance variable is a way to define and keep track of the state of an
    object. They are scoped at the object level and are declared using a leading
    `@` symbol. An example of an instance variable would be:
    
    ```ruby
    class Thing
      def initialize(name)
        @name = name # On this line, the instance variable @name is assigned to name
      end
    end
    
    thing = Thing.new("thing")
    p thing # => #<Thing:0x00007f086e291418 @name="thing">   
    ```
    
15. What is an instance method? Provide an example.
    
    An instance method is a method available to objects of the class in which
    the method is defined. An example of an instance method would be:
    ```ruby
    class Thing
      def do_a_thing # This is the instance method
        "I'm doing a thing!"
      end
    end
    
    thing = Thing.new
    puts thing.do_a_thing # => "I'm doing a thing!"
    ```
16. What are getter and setter methods? Provide an example.
    
    A getter method is an instance method which returns the value to which the
    instance variable of the corresponding name is assigned. It may have
    additional functionality beyond that. For example:
    
    ```ruby
    class Thing
      def initialize
        @name = "thing"
      end
      
      def name # getter method
        @name  # returns @name
      end
    end
    ```
    
    A setter method is a method which will reassign an instance variable to a
    new value. A setter method will always return the value which it is passed
    as an argument, even if something else is explicitly returned.
    
    ```ruby
    class Thing
      def initialize
        @name = "thing"
      end
      
      def name=(value) # setter method
        @name = value  # @name is reassigned to value
      end
    ```

17. What are accessor methods? Provide an example.
    
    An accessor method is a shorthand for creating a getter and a setter method
    for a given instance variable in one line. An example would be:
    
    ```ruby
    class Foo
      def initialize
        @name = "Bar"
      end
      
      attr_accessor :name # accessor method
    end
    
    thing = Foo.new 
    puts thing.name # => 'Bar'
    thing.name = "Baz"
    puts thing.name # => 'Baz'
    ```

18. What are class methods? Provide an example.
    
    A class method is a method which can be called directly on a class. Class
    methods do not have access to instance variables and are defined with a
    leading `self`. For example:
    
    ```ruby
    class Foo
      def self.do_a_thing
        puts "I'm doing a thing!"
      end
    end
    
    Foo.do_a_thing # => "I'm doing a thing!"
    ```

19. What are class variables? Provide an example.

    A class variable is a variable which pertains to an entire class, and not
    just one instance. Instance methods have access to class variables, and are
    created with two `@@` symbols. For example:
    
    ```ruby
    class Foo
      @@bar = "baz" # class variable
      
      def self.bar  # getter method for @@bar
        @@bar
      end
    end
    
    puts Foo.bar    # => "baz"
    ```

20. What are constant variables? Provide an example.

    A constant variable is a value which will not change during the runtime of
    the program. They are useful as a way to refer to a specific value
    throughout your program, and if it needs to be changed later then it can be
    changed in just one place. Constants have lexical scope in Ruby, meaning
    that where they are defined is important. They can be referred to using the
    namespace resolution operator (`::`). An example of a constant:
    
    ```ruby
    module WhatIsIt
      def tell_me_about_it
        puts Foo::SOMETHING # namespace resolution
      end
    end
    
    class Foo
      include WhatIsIt
      
      BAR = 'baz'           # constant definition
      SOMETHING = 'this is it!'
      
      attr_reader :name
      
      def initialize
        name = BAR
      end
    end
    
    thing = Foo.new
    thing.name             # => 'baz'
    thing.tell_me_about_it # => 'this is it!'
    ```

21. What's the difference between instance and class variables?
    
    Instance variables are scoped at the object level, while class variables are
    scoped at the class level.

22. What's the difference between instance and class methods?

    The difference between class and instance methods is that instance methods
    are available to objects of a class, and have access to both instance and
    class variables. Class methods are not available to objects of a class, but
    are only available to be called on the class itself. They have access to
    class variables and not instance variables.

23. Why do custom classes usually define a to_s method?

    A custom `to_s` method is usually defined by classes in order to make it's
    reaction to `to_s` more human-readable and useful for the programmer. It
    will override any `to_s` method up the method lookup path, and the
    programmer can select relevant attribute(s) from the class, or specify a
    formatting they would like to use.

24. What is class inheritance? Provide an example.

    Class inheritance is when one class can take on attributes and behaviors
    from another class. For example:
    
    ```ruby
    class Animal
      def initialize(name)
        @name = "Wally"
      end
      
      def say_name
        puts @name
      end
    end
    
    class Cat < Animal; end
    
    wally = Cat.new("Wally")
    p wally         # => #<Cat:0x00007f25b8110d70 @name="Wally">
    wally.say_name  # => Wally
    ```
    
    In this example, the `Cat` class has no methods or attributes defined within
    it. However, when a new `Cat` object is instantiated and `new` is passed
    `"Wally"` as an argument, the resulting `Cat` object has a `@name` of
    `"Wally"`, and can `say_name`.

25. What is method overriding? Provide an example.

    Method overriding is when there is a method of the same name in both a
    subclass and a superclass, for example. The method in the subclass will take
    precedence over the method from the superclass. Here is a concrete example:
    
    ```ruby
      class Animal
        def walk
          puts "I'm walking!"
        end
      end
      
      class Frog > Animal
        def walk
          puts "I'm hopping!"
        end
      end
      
      frog = Frog.new
      frog.walk # => "I'm hopping!"
    ```

26. When are Modules used? What is interface inheritance? What is multiple inheritance?

    Modules are used when there is a "has a" relationship involved, or if the
    programmer is looking to disambiguate code they have written from similarly
    named code from an existing library (namespacing). Interface inheritance
    occurs when a module is mixed into a class. Objects of that class "inherit",
    or have access to, behaviors defined within the module. Multiple inheritance
    is the ability for an object of a class to inherit interfaces from multiple
    sources. Technically Ruby is a single inheritance language, as classes can
    only have a single superclass. However, Ruby approximates multiple
    inheritance through the use of mix-in modules.

27. What is namespacing? When is using namespacing beneficial?

    Namespacing is the practice of using modules to group similar and related
    class and behaviors under one name. It is beneficial when code the
    programmer has written might potentially conflict name-wise with code in
    existing libraries. Namespaces can be referenced using the namespace
    resolution operator (`::`).
  
28. What is method access control?

    Method access control is is the practice of limiting the publicly available
    interface of a class using access modifiers. Method access control is useful
    in that it allows the programmer to define the ways in users can interact
    with portions of the program. 

29. How are encapsulation and method access control related?

    Encapsulation and method access control are closely related in that they
    both involve hiding aspects of the inner workings of classes. Encapsulation
    refers to the hiding of implementation details of a class from other parts
    of the program, while method access control refers to hiding those
    implementation details from users of the class. The line is a bit blurry,
    as sometimes the "user" of a class can be a programmer making changes to
    existing code. Both are in place in order to protect the integrity of the
    inner workings of a class, and make its interaction with the rest of the
    code more predictable.

30. What are the differences between public, private, and protected methods?

    Public methods are available from anywhere in the code. They can be called
    on any object of a given class.
    
    Private methods are only available from within the class itself, and may not
    be called with an explicit receiver. Only the current instance of the class
    has access to private methods
    
    Protected methods act as private methods outside of a class, but inside the
    class they act as public methods and can be called with explicit receivers.

    Protected can't be called outside of the class, but can be called inside of
    the class by other objects of the same class.

31. What are collaborator objects? Why are they important in OOP?

    Collaborator objects are objects that have been stored as instance variables
    of another object. The are important as they form the basis for how OOP
    works in Ruby. Since everything is an object, those objects must be able to
    be used to define the state of objects.

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

In this code, a module `Swimmable` is defined and mixed into the classes `Fish`
and `Dog` using the `include` keyword. A class `Animal` is defined, along with
two classes which subclass from `Animal`, `Fish` and `Mammal`. An additional two
classes are defined, `Cat` and `Dog`, which subclass from `Mammal`.

After these class and module definitions, local variables `sparky`, `neemo`, and
`paws` are assigned to new `Dog`, `Fish`, and `Cat` objects. `swim` is then
called on these three objects. For the first two, the code will return 
`"I'm swimming!"` (with no output), and the last will give a `NoMethodError`, as
the `Cat` class does not have access to `Swimmable#swim`.

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

The final line of code here will output:
```
Animal
Walkable
Object
Kernel
BasicObject
```

(and return `nil`)

This is the method lookup path for the `Animal` class. The second location in
the path is `Walkable`, as it has been mixed into the `Animal` class.

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

The last line of code will output:

```
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```

(and return `nil`)

The method lookup path starts at the calling class, then goes through the
included modules, starting with the last inclusion. After it has checked the
modules, it will move on to the nearest superclass, in this case `Animal`. After
that it will go to `Walkable`, as that module is mixed into `Animal`. It will
then traverse through `Object`, `Kernel`, and finally `BasicObject`.

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

This is an example of namespacing. The `Mammal` module is used to organize the
classes `Dog` and `Cat`, so they can be referred to using the namespace
resolution operator (`::`). An usage example would be:

```ruby
Mammal::Dog.new.speak('Arf!') # => 'Arf!'
Mammal::Cat.new.say_name('Maytag') # => 'Maytag'
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

This code will output `Will this work? IDK, I'm protected!`. Because
`a_public_method` is public, there is no issue calling it outside of the
`Animal` class. Because `fido` is an object of the `Animal` class, it has access
to `a_protected_method`. In fact, in this case it would even have access if the
method was private.

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
