# *--------------------------------+
# |  *~  RB129 Code Snippets  ~*   |
# +--------------------------------+

# ----------------------------------
# Classes and Objects
# ----------------------------------

# ----------------------------------
# Objects
# ----------------------------------
string1 = 'a'
string2 = 'a'
p string1.object_id
p string2.object_id

# ----------------------------------
# Classes
# ----------------------------------
p "string".class # => String
p 1.class        # => Integer

# ----------------------------------
# Object Instantiation
# ----------------------------------
class Cat; end
wally = Cat.new
p wally # => #<Cat:0x00007ff6af511eb0>

# ----------------------------------
# Instance Variables
# ----------------------------------
class Cat
  def initialize(name)
    @name = name
  end
end

wally = Cat.new("Wally")
p wally # => #<Cat:0x00007f30c87bb3f8 @name="Wally">

# ----------------------------------
# Instance Methods
# ----------------------------------
class Cat
  def walk
    puts "I'm walking!"
  end
end

wally = Cat.new
wally.walk # => I'm walking!

# ----------------------------------
# Class Variables
# ----------------------------------
class Cat
  @@total_cats = 0
end

# ----------------------------------
# Class Methods
# ----------------------------------
class Cat
  def self.meow
    puts "Meow!"
  end
end

Cat.meow # => "Meow!"

# ----------------------------------
# Instance Methods vs Class Methods
# ----------------------------------

class Cat
  def self.meow
    puts "Meow!"
  end

  def meow
    puts "Meow!"
  end
end

Cat.meow
wally = Cat.new
wally.meow

# ----------------------------------
# Setter and Getter Methods
# ----------------------------------
class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

wally = Cat.new("Wally")
puts wally.name
wally.name = "Walter"
puts wally.name

# ----------------------------------
# Using attr_*
# ----------------------------------
class Cat
  def initialize(name)
    @name = name
  end

  attr_accessor :name
end

wally = Cat.new("Wally")
puts wally.name
wally.name = "Walter"
puts wally.name

# ----------------------------------
# Method Access Control
# ----------------------------------

# ----------------------------------
# Public
# Private
# Protected
# ----------------------------------
class BankAccount
  include Comparable

  def initialize(acct_number, balance)
    @acct_number = acct_number
    @balance = balance
  end

  def to_s
    number = acct_number.to_s
    "***" + number[-2..-1]
  end

  def <=>(other)
    balance <=> other.balance
  end

  protected

  attr_reader :balance

  private

  attr_reader :acct_number
end

account = BankAccount.new(12345, 50)
account2 = BankAccount.new(12346, 100)
puts account
puts account2
puts account2 > account

# ----------------------------------
# Inheritance
# Class Inheritance
# Interface Inheritance
# ----------------------------------
module Hittable
  def hit_with_stick
    p "Boom!"
  end
end

class Instruments
  def play
    p "#{self.class} is making music!"
  end
end

class Brass < Instruments
end

class Percussion < Instruments
  include Hittable
end

class Pan
  include Hittable
end

class Person
  def hit_with_stick
    p "Ow!"
  end
end

drum = Percussion.new
trumpet = Brass.new
frying_pan = Pan.new

trumpet.play
drum.play
violin.play
frying_pan.hit_with_stick
drum.hit_with_stick

# ----------------------------------
# Method Lookup Path
# ----------------------------------
module Playable; end

class Instrument
  include Playable
end

class Trumpet < Instrument; end

puts Trumpet.ancestors # => Trumpet, Instrument, Playable, Object, Kernel, BasicObject

# ----------------------------------
# Super
# ----------------------------------

# ----------------------------------
# Passing super an argument
# ----------------------------------
class Instrument
  def initialize(serial_number)
    @serial_number = serial_number
  end
end

class Trumpet
  def initialize(serial_number, key)
    super(serial_number)
    @key = key
  end
end

drum = Instrument.new(123)
trumpet = Instrument.new(1234, 'C')
p trumpet
p drum

# ----------------------------------
# No Argument
# ----------------------------------
class Instrument
  @@instruments_produced = 0

  def initialize
    @@instruments_produced += 1
  end

  def self.instruments_produced
    @@instruments_produced
  end
end

class Trumpet < Instrument
  def initialize(key)
    super()
    @key = key
  end
end

p Instrument.instruments_produced # => 0
trumpet = Trumpet.new('C')
p Instrument.instruments_produced # => 1

# ----------------------------------
# Variable Scope with Inheritance

# Instance Variables with inheritance
# ----------------------------------
class Person
  def initialize(name)
    @name = name
  end
end

class Lawyer < Person
  def introduce
    puts "Hi! I'm a lawyer, and my name is #{@name}" # @name accessible to subclass
  end
end

class Paramedic < Person
  def initialize(name); end

  def introduce
    puts "Hi! I'm a paramedic, and my name is #{@name}"
  end
end

bob = Lawyer.new('Bob')
bob.introduce # => "Hi! I'm a lawyer, and my name is Bob"
jim = Paramedic.new('Jim')
jim.introduce # => "Hi! I'm a paramedic, and my name is"

# ----------------------------------
# Class variables with inheritance
# ----------------------------------
class Instrument
  @@instruments_produced = 0

  def initialize
    @@instruments_produced += 1
  end

  def self.instruments_produced
    @@instruments_produced
  end
end

class Trumpet < Instrument
  @@instruments_produced = 2
end

puts Instrument.instruments_produced # => 0
trumpet = Trumpet.new
puts Instrument.instruments_produced # => 3

# ----------------------------------
# Polymorphism & Encapsulation
# ----------------------------------

# ----------------------------------
# Polymorphism
# ----------------------------------
class Car
  def move
    puts "I'm driving!"
  end
end

class Plane
  def move
    puts "I'm flying!"
  end
end

car = Car.new
plane = Plane.new
car.move   # => "I'm driving!"
plane.move # => "I'm flying!"

# ----------------------------------
# Polymorphism Through Inheritance
# ----------------------------------
class Instrument
  def key
  end
end
class Trumpet < Instrument
  def key
    puts "Bb"
  end
end

class BassDrum < Instrument
end

trumpet = Trumpet.new
drum = BassDrum.new
trumpet.key # => "Bb"
drum.key    # => No output, because drums aren't pitched

# ----------------------------------
# Polymorphism Through Duck Typing
# ----------------------------------
class Restaurant
  attr_reader :guests, :ingredients

  def service(employees)
    employees.each do |employee|
      employee.serve_food(self)
    end
  end
end

class Chef
  def serve_food(restaurant)
    make_food(restaurant.ingredients)
  end

  def make_food(ingredients)
    # implementation
  end
end

class Waiter
  def serve_food(restaurant)
    serve_guests(restaurant.guests)
  end

  def serve_guests(guests)
    # implementation
  end
end

# ----------------------------------
# Encapsulation
# ----------------------------------
class BankAccount
  attr_reader :balance

  def initialize(initial_balance)
    @balance = initial_balance
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount if (balance - amount) >= 0
  end

  private

  attr_writer :balance
end

# ----------------------------------
# Modules
# Mixin Modules
# Module Methods
# ----------------------------------
module Packable
  def pack
    puts "I'm ready to go fly on a plane!"
  end
end

class Trumpet    # => Trumpets can fly on a plane
  include Packable
end

class GrandPiano # => Can't take a piano on a plane
end

# ----------------------------------
# Namespacing
# ----------------------------------
module Instrument
  class Trumpet
    def self.play
      puts "Toot toot!"
    end
  end

  class BassDrum
    def self.play
      puts "Boom boom!"
    end
  end
end

Instrument::Trumpet.play  # => "Toot toot!"
Instrument::BassDrum.play # => "Boom boom!"

# ----------------------------------
# Self
# ----------------------------------
# Inside Instance Methods
# ----------------------------------
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def introduce_self
    puts "Hi, I'm #{self}"
  end

  def to_s
    name
  end
end

# ----------------------------------
# self Inside Class Definitions
# self Inside Class Methods
# ----------------------------------
class Person
  def self.describe_self
    puts "I'm a #{self}!"
  end
end

Person.describe_self

# Inside Mixin Modules
module Packable
  def pack?
    puts "#{self.class}s can fly on planes!" # => self refers to calling object
  end

  def self.pack
    puts "This is the #{self} module!"
  end
end

class Trumpet    # => Trumpets can fly on a plane
  include Packable
end

class GrandPiano # => Can't take a piano on a plane
end

trumpet = Trumpet.new
trumpet.pack  # => "Trumpets can fly on planes!"
Packable.pack # => "This is the Packable module!"

# ----------------------------------
# self Outside Any Class
# ----------------------------------
puts self # => main

# ----------------------------------
# Fake Operators and Equality
# ----------------------------------

# ----------------------------------
# Equivalence
# ----------------------------------

# ----------------------------------
# ==
# ----------------------------------
class Car
  attr_reader :passengers

  def initialize(passengers)
    @passengers = passengers
  end

  def ==(other_car)
    passengers == other_car.passengers
  end
end

car1 = Car.new(2)
car2 = Car.new(3)

car1 == car2 # => false

# ----------------------------------
# equal? and object_id
# ----------------------------------
class Car
end

car1 = Car.new
car2 = Car.new
car1.object_id
car2.object_id
car1.equal?(car2) # => false

# ----------------------------------
# ===
# ----------------------------------
Class === String # => true
String === Class # => false

# eql?
hash1 = { a: 1, b: 2 }
hash2 = { a: 1, b: 2 }
puts hash1.object_id
puts hash2.object_id
puts hash1.eql?(hash2) # => true

# ----------------------------------
# Fake Operators
# ----------------------------------

# ----------------------------------
# Comparison Methods
# ----------------------------------
class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def >(other_acct)
    balance > other_acct.balance
  end

  def <(other_acct)
    balance < other_acct.balance
  end

  private

  attr_reader :balance
end

acct1 = BankAccount.new(50)
acct2 = BankAccount.new(100)
puts acct1 > acct2 # => false
puts acct1 < acct2 # => true

# ----------------------------------
# Right and Left Shift
# ----------------------------------
class Car
  attr_reader :passengers

  def initialize
    @passengers = []
  end

  def <<(passenger)
    @passengers << passenger
  end
end

car = Car.new
car << "Bob"
puts car.passengers # => Bob

# ----------------------------------
# Plus
# ----------------------------------
class CustomNumberClass
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def +(other_custom_number)
    value + other_custom_number.value
  end
end

one = CustomNumberClass.new(1)
two = CustomNumberClass.new(2)

puts(one + two) # => 3

# ----------------------------------
# Element Setters and Getters
# ----------------------------------
class Car
  attr_reader :passengers

  def initialize
    @passengers = ["bob", "sara"]
  end

  def [](idx)
    @passengers[idx]
  end

  def []=(idx, new_passenger)
    @passengers[idx] = new_passenger
  end
end

car = Car.new
puts car[0] # => 'bob'
car[0] = 'Scott'
puts car[0] # => 'Scott'

# ----------------------------------
# Collaborator Objects
# ----------------------------------
class Band
  def initialize
    @drummer = Drummer.new("Ringo")
  end
end

class Drummer
  def initialize(name)
    @name = name
  end
end
