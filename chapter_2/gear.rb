# create class with single responsibility
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # tire goes around rim twice for diameter
    ratio * wheel.diamter
  end

  # add diamter method to enforce single responsibility
  # def diameter
  #   rim + (tire * 2)
  # end

  # isolate extra responsibility in classes
  Wheel = Struct.new(:rim, :tire) do
    def diamter
      rim + (tire * 2)
    end
  end
end

puts Gear.new(52, 11, 26, 1.5).ratio
puts Gear.new(30, 27, 24, 1.25).ratio
puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(30, 27, 24, 1.25).gear_inches

puts Gear.new(52, 11)
