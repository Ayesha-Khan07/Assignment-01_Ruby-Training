'''This program defines a library system where different types of books (novels and magazines)
    have customized borrowing periods using inheritance and method overriding'''

class Book
  attr_reader :title
  def initialize(title)
    @title = title
  end

  def borrow_period
    14 
  end
end

class Novel < Book
  def borrow_period
    super + 7  
  end
end

class Magazine < Book
  def borrow_period
    7 
  end
end

novel = Novel.new("Ruby Tales")
magazine = Magazine.new("Tech Monthly")

puts "#{novel.title} borrow period: #{novel.borrow_period} days"
puts "#{magazine.title} borrow period: #{magazine.borrow_period} days"
