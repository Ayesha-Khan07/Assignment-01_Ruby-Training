# Topics: Ranges, predicate methods, conditional return

# this code checks if a person is a child, teenager, or adult using ranges and give discount i subscription and retur a bolean value

def age_discount(age)
  case age
  when 0..12
    category = "Child"
    discount = 0
  when 13..19
    category = "Teenager"
    discount = 10
  when 20..49
    category = "Adult"
    discount = 20
  else
    category = "Senior Citizen(50+)"
    discount = 60
  end

  puts "Category: #{category}, Age: #{age}, Discount: #{discount}%"

end

puts age_discount(10)   
puts age_discount(16)   
puts age_discount(25)   
puts age_discount(55)  