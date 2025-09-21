class Driver
  attr_accessor :name, :current_location, :destination, :fare

  def initialize(name)
    @name = name
    @current_location = nil
    @destination = nil
    @fare = nil
  end

  def set_ride(current_location, destination, fare)
    @current_location = current_location
    @destination = destination
    @fare = fare
  end

  def to_s
    "#{@name} (#{@current_location} -> #{@destination} fair -> #{@fare})"
  end
end


class Rider
  attr_accessor :name, :booked_rides

  def initialize(name)
    @name = name
    @booked_rides = []
  end

  def book_ride(drivers, current_location, destination)

    available_drivers = drivers.select do |d|             #select -> filter elements
      d.current_location.downcase == current_location.downcase &&
      d.destination.downcase == destination.downcase
    end

    if available_drivers.empty?
      puts "No drivers available for your route."
      return
    end

    puts "\nAvailable Drivers for your route:"
    available_drivers.each_with_index do |d, index|
      puts "#{index + 1}. #{d}"
    end

    print "Select a driver by number: "
    choice = gets.chomp.to_i - 1

    if choice >= 0 && choice < available_drivers.size
      selected_driver = available_drivers[choice]
      @booked_rides << selected_driver
      puts "You have successfully booked #{selected_driver.name}'s ride!"
      # Remove driver from available drivers List 
      drivers.delete(selected_driver)
    else
      puts "Invalid selection!"
    end
  end

  def show_booked_rides
    puts "\n#{@name}'s Booked Rides:"
    if @booked_rides.empty?
      puts "No rides booked yet."
    else
      @booked_rides.each_with_index do |d, index|
        puts "#{index + 1}. #{d}"
      end
    end
  end
end

# ---------------- Main Program ----------------

drivers = []
driver1 = Driver.new("Ali")
driver1.set_ride("lahore", "isl",1500)
drivers << driver1

driver2 = Driver.new("Sara")
driver2.set_ride("johar town", "DHA",300)
drivers << driver2

driver3 = Driver.new("Omar")
driver3.set_ride("lahore", "isl",1800)
drivers << driver3

rider = Rider.new("Ayesha")

puts "Enter your current location:"
rider_current = gets.chomp

puts "Enter your destination:"
rider_destination = gets.chomp

rider.book_ride(drivers, rider_current, rider_destination)

rider.show_booked_rides

puts "\nRemaining Drivers:"
drivers.each { |d| puts d }
