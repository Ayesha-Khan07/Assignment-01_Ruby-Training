#program takes a temperature and convert into celcius or fahrenheit (methods practice)

class Temperature
  def initialize(temp)
    @temp = temp
  end

  # normal method
  def to_fahrenheit
    (@temp * 9.0 / 5) + 32
  end

  # endless method
  def to_celsius = (@temp - 32) * 5.0 / 9
end


cel = Temperature.new(25)
puts "25°C in Fahrenheit: #{cel.to_fahrenheit}"

f = Temperature.new(77)
puts "77°F in Celsius: #{f.to_celsius}"
