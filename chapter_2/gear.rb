# create class with single responsibility
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel = nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # tire goes around rim twice for diameter
    ratio * wheel.diameter
  end

  # add diamter method to enforce single responsibility
  # def diameter
  #   rim + (tire * 2)
  # end

  # isolate extra responsibility in classes
  # Wheel = Struct.new(:rim, :tire) do
  #   def diamter
  #     rim + (tire * 2)
  #   end
  # end
end

# extract wheel class because of more requirements
class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

# Both classes have single responsibility!!

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

puts Gear.new(52, 11, @wheel).gear_inches
puts Gear.new(52, 11).ratio

# puts Gear.new(52, 11, 26, 1.5).ratio
# puts Gear.new(30, 27, 24, 1.25).ratio
# puts Gear.new(52, 11, 26, 1.5).gear_inches
# puts Gear.new(30, 27, 24, 1.25).gear_inches
#
# puts Gear.new(52, 11)
