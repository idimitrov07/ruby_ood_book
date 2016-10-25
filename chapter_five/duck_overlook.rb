# overlooking the duck
class Trip
  attr_reader :bicycles, :customers, :vehicle

  # this 'mechanic' could be of any class..
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end

  # ...
end

# 'Mechanic' class in not referenced anywhere in the class above
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle)  }
  end

  def prepare_bicycle(bicycle)
    #...
  end
end
