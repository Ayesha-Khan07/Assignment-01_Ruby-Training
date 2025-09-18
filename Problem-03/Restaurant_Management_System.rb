# menu class
class Item
  attr_accessor :name, :price

  def initialize(n,p)
    @name = n
    @price = p
  end

  def to_s
  "Item name: #{@name}\n" \
  "Item Price: #{@price}\n\n" 
  end

end

class Order
  attr_accessor :customer_name, :item

  def initialize(cn)
    @customer_name = cn
    @items = []
  end

  def add_item(item_name)
    @items << item_name
    puts "Item #{item_name} is added to #{@customer_name}'s order."
  end

  def remove_item(item)
    if @items.delete(item)
      puts "Item #{item} deleted successfully."
    else
      puts "#{item} not found in order."
    end
  end

  def total_price
    @items.reduce(0) {|sum,item| sum + item.price}
  end

  def show_order
    puts "Order for #{customer_name}:"
    @items.each { |item| puts item }
    puts "Total: pkr.#{total_price}"
  end

end

#------- main function -------
menu_items = %w[pizza burger pasta steak]
menu_price = [1200, 300, 800, 1700]

menu = menu_items.each_with_index.map{ |name, i| Item.new(name,menu_price[i])}

#show menu
puts "Menu: "
menu.each_with_index do |item, index|
  puts "#{index + 1}. #{item}" 
end
puts "\n"

order1 = Order.new("ayesha")

loop do
  puts "\nEnter the number of the item you want to order (or type 0 to finish):"
  choice = gets.chomp.to_i      #chomp remove the trailing new line 

  break if choice == 0   

  if choice >= 1 && choice <= menu.size
    order1.add_item(menu[choice - 1])
  else
    puts "Invalid choice. Please select a valid menu item."
  end
end

puts "\nFinal Order:"
order1.show_order
