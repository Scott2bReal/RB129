class Person
  def initialize(name, job)
    @name = name
    @job = job
  end

  def to_s; "My name is #{@name} and I am a #{@job}"; end

  roger = Person.new("Roger", "Carpenter")
  puts roger
end
