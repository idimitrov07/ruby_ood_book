# specify defaults by merging a defaults hash
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * diameter
  end

  def diameter
    wheel.diameter
  end

  def defaults
    {
      chainring: 40,
      cog: 18
    }
  end
end

# old wheel class
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

puts Gear.new(
  wheel: Wheel.new(26, 1.5)).gear_inches
