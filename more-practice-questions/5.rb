class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.

# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches
# tall.”` Why does our `change_info` method not work as expected?
#
# change_info doesn't reassign the instance variables for name height and weight
# because the setter methods are not actually being called. Instead, local
# variables name heigh and weight are initialized and assigned to the
# corresponding argument values. To fix this, self can be prepended to name
# height and weight, or the instance variables themselves may be directly
# referenced. 
