# Classes and Objects

# Objects
string1 = 'a'
string2 = 'a'
p string1.object_id
p string2.object_id

# Classes
p "string".class #
p 1.class

# Object Instantiation
class Cat; end
wally = Cat.new
p wally

# Instance Variables
class Cat
  def initialize(name)
    @name = name
  end
end

wally = Cat.new("Wally")
p wally

# Instance Methods
class Cat
  def walk
    puts "I'm walking!"
  end
end

wally = Cat.new
wally.walk # => I'm walking!

# Class Variables
class Cat
  @@total_cats = 0

  def initialize
    @@total_cats += 1
  end
end

p Cat.class_variables
wally = Cat.new
p Cat.class_variables

# Class Methods

class Cat
  def self.meow
    puts "Meow!"
  end
end

Cat.meow # => "Meow!"

# Instance Methods vs Class Methods

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

# Setter and Getter Methods
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

# Using attr_*
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

# Method Access Control
# Public
# Private
# Protected
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

# Inheritance
# Class Inheritance
# Interface Inheritance
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

# Method Lookup Path
module Playable; end

class Instrument
  include Playable
end

class Trumpet < Instrument; end

puts Trumpet.ancestors # => Trumpet, Instrument, Playable, Object, Kernel, BasicObject

# Super
class Instrument
end

class Trumpet
end
# Object Methods
# Variable Scope with Inheritance
# Polymorphism & Encapsulation
# Polymorphism
# Polymorphism Through Inheritance
# Polymorphism Through Duck Typing
# Encapsulation
# Modules
# Mixin Modules
# Namespacing
# Module Methods
# Self
# Inside Instance Methods
# Inside Class Methods
# Inside Class Definitions
# Inside Mixin Modules
# Outside Any Class
# Fake Operators and Equality
# Equivalence
# ==
# equal? and object_id
# ===
# eql?
# Fake Operators
# Comparison Methods
# Right and Left Shift
# Plus
# Element Setters and Getters
# Collaborator Objects
