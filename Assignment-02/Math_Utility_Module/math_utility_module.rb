# 

module MathHelper
  def square(n)
    n**2
  end

  def cube(n)
    n**3
  end

  def power(n, exponent=2)
    n**exponent
  end

  def factorial(n)
    if n <= 1
        return 1
    else
        result = 1
        (1..n).each do |var|
            result *= var
        end
        return result
    end
  end

  # Handle arrays
  def apply_to_array(numbers, method_name)
    numbers.map { |num| send(method_name, num) }
  end
end

class Calculator
  include MathHelper

end

calc = Calculator.new

puts "square of 4: #{calc.square(4)}"        
puts "cube of 3: #{calc.cube(3)}"              
puts "power of 2(without 2nd parameter): #{calc.power(2)}"  
puts "power of 2(without 2nd parameter): #{calc.power(2,5)}" 
puts "factorial of 5: #{calc.factorial(5)}"    


numbers = [2, 3, 4]
puts numbers
puts "Squares of array: #{calc.apply_to_array(numbers, :square)}"
puts "Cubes of array: #{calc.apply_to_array(numbers, :cube)}"
