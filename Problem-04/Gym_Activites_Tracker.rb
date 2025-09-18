
class Activity
  attr_accessor :type, :duration, :calories

  def initialize(type, duration, calories)
    @type = type         
    @duration = duration 
    @calories = calories 
  end

  def to_s
    "#{@type} - #{@duration} min - #{@calories} cal"
  end
end

#user class
class User
  attr_accessor :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def track_activity(activity)
    @activities << activity
    puts "tracked activity: #{activity}"
  end

  def show_activities
    puts "\nActivity track record for #{@name}:"
    @activities.each_with_index do |act, index|
      puts "#{index + 1}. #{act}"
    end
  end

  def total_calories
    @activities.reduce(0) { |sum, act| sum + act.calories }
  end
end

# ---------------- Main Program ----------------


user1 = User.new("Ayesha")

loop do
  puts "\nEnter activity type (running/cycling) or type 'exit' to finish:"
  type = gets.chomp
  break if type.downcase == "exit"

  puts "Enter duration in minutes:"
  duration = gets.chomp.to_i

  puts "Enter calories burned:"
  calories = gets.chomp.to_i


  activity = Activity.new(type.capitalize, duration, calories)
  user1.track_activity(activity)
end

user1.show_activities
puts "\nTotal calories burned: #{user1.total_calories}"
