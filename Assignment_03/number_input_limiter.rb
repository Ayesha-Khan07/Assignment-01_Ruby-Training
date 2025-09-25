class NegativeNumberError < StandardError; end

catch(:too_many_attempts) do
  attempts = 0

  loop do
    begin
      print "Enter a number: "
      input = gets.chomp
      
      number = Integer(input)
      
      if number < 0
        raise NegativeNumberError, "Negative number not allowed!" 
      end
      
      puts "You entered: #{number}"
      break 

    rescue ArgumentError => e
      puts "Invalid input: #{e.message}"  
      attempts += 1

    rescue NegativeNumberError => e
      puts e.message
      attempts += 1

    ensure
      puts "Attempt complete\n\n"
    end
    
    if attempts >= 3
        puts "Too many failed attempts. Exiting..." 
        throw :too_many_attempts 
    end
  end
end


