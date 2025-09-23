# movie class
class Movie
  attr_accessor :title, :type

  def initialize(title, type)  
    @title = title
    @type = type
  end

  def to_s
    "The movie details are:\n" \
    "Movie Title: #{@title}\n" \
    "Movie Type: #{@type}\n"
  end
end

# theatre class
class Theatre
  attr_accessor :name, :movies, :bookings

  def initialize(name)          
    @name = name
    @movies = []          #array of hash objects
    @bookings = Hash.new { |h, k| h[k] = [] } # store showtime(key) => seats(value)
  end

  def add_movie(movie, showtime)
    @movies << { movie: movie, showtime: showtime }
  end

  def available_seats(showtime)
    all_seats = (1..10).to_a
    booked = @bookings[showtime]            #return array of booked seats 
    available = all_seats - booked
    available.slice(0, 7)                   # show first 7 available seats
  end
end

# booking class
class Booking
  attr_accessor :theatre, :username

  def initialize(theatre, username)
    @theatre = theatre
    @username = username
  end

  def book_ticket(showtime, seat)
    if @theatre.available_seats(showtime).include?(seat)
      @theatre.bookings[showtime] << seat
      price = 100
      price = yield(price) if block_given? # apply discount
      puts "#{@username} booked seat #{seat} for #{showtime}, price: #{price}"
    else
      puts "Seat #{seat} for #{showtime} is already booked!"
    end
  end

  def cancel_ticket(showtime, seat)
    if @theatre.bookings[showtime].include?(seat)
      @theatre.bookings[showtime].delete(seat)
      puts "#{@username} cancelled seat #{seat} for #{showtime}"
    else
      puts "No booking found for seat #{seat} at #{showtime}"
    end
  end
end

# ----- main -----

m1 = Movie.new("Alice in Borderland", "Action")
m2 = Movie.new("Death Note - EP 1", "Animation")

t = Theatre.new("Cineplex")
t.add_movie(m1, "10AM")
t.add_movie(m2, "2PM")

# lambda filter
action_movies = ->(movie_list) { movie_list.select { |m| m[:movie].type == "Action" } }
puts "Action movies:"
action_movies.call(t.movies).each { |m| puts m[:movie] }

b = Booking.new(t, "Alice")

# book tickets with discount
b.book_ticket("10AM", 3) { |price| price * 0.8 } 

# try booking the same seat again
b.book_ticket("10AM", 3)

puts "Available seats for 10AM: #{t.available_seats("10AM").inspect}"

# cancel booking
b.cancel_ticket("10AM", 3)

puts "All showtimes:"
t.movies.each do |m|
  puts m[:showtime]
end

titles = t.movies.map { |x| x[:movie].title }
puts "All movies in theatre: #{titles}"

