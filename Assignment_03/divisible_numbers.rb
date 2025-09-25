''' 
Problem statement: 
    Prints all numbers from 1 to 20 divisible by 3 or 5 (but not both), 
    shows whether each is “Small” (≤10) or “Big” (>10), and counts how many were printed.'''

count = 0
arr = (1..20).to_a
arr.each do |num|
    if num%3 == 0 && num%5 != 0
        count += 1
        puts "#{num} - #{num<=10 ? "Small" : "Big"}"
    elsif num%5 == 0 && num%3 != 0 
        count += 1
        puts "#{num} - #{num<=10 ? "Small" : "Big"}"
    else
        next
    end
end

puts "\nTotal printed:  #{count}"
puts "\n"