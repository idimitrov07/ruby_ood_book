# ways to find hidden ducks
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each { |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end

# another way to write the case statement using kind_of?, but no improvement..
class Trip
  #...
  def prepare(preparers)
    preparers.each { |preparer|
      if preparer.kind_of?(Mechanic)
        preparer.prepare_bicycles(bicycles)
      elsif preparer.kind_of?(TripCoordinator)
        preparer.buy_food(customer)
      elsif preparer.kind_of?(Driver)
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end

# rewrite trying not to depend on class names using responds_to?
class Trip
  #...
  def prepare(preparers)
    preparers.each { |preparer|
      if preparer.responds_to?(:prepare_bicycle)
        preparer.prepare_bicycle(bicycles)
      elsif preparer.responds_to?(:buy_food)
        preparer.buy_food(customers)
      elsif preparer.responds_to?(:gas_up)
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end
