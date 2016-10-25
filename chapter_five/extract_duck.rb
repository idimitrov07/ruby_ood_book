# Trip prepare becomes simpler, extract ducks
# it is easier to take new 'Preparers' if needed
class Trip
  attr_reader :bicycles, :customer, :vehicle

  def prepare(preparers)
    preparers.each { |preparer| preparer.prepare_trip(self)  }
  end
end

# every preparer is a 'Duck' that responds to 'prepare_trip'
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle| prepare_bicycle(bicycle)  }
  end

  #...
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  #...
end

def Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  #...
end
