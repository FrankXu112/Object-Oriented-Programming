class Caculate
	
	attr_accessor :qty, :item, :price

	def initialize(qty, item, price)
		@qty = qty
		@item = item
		@price = price
		@tax = 0
		@total_price = 0
	end
			

	def process_input
		puts "Enter a kind of good: "
		puts "-- '1' for general goods"
		puts "-- '2' for exemption goods(book, food, medical products)"
		puts "-- '3' for imported goods"
		
		command = gets.chomp.to_i
		
		case command
		when 1
			general_tax
		when 2
			exemption_tax
		when 3
			imported_tax
		end
	end

	def general_tax
		@tax = (@qty * @price * 0.1).round(2)
		@price = (@price + @tax).round(2)
		@total_price = @price
	end

	def exemption_tax
		@tax = 0
		@total_price = @price
	end

	def imported_tax
		@tax = (@qty * @price * 0.15).round(2)
		@price = (@price + @tax).round(2)
		@total_price = @price
	end

	def to_s
		puts "item: #{@qty} #{@item}, price: #{@price.round(2)}"
	end
end


class Rolodex

	def initialize
		@list = []
	end

	def add_item
		puts "Enter the quantity of item:"
		qty = gets.chomp.to_i
		puts "Enter an item:"
		item = gets.chomp
		puts "Enter the price:"
		price = gets.chomp.to_f


		new_item = Caculate.new(qty, item, price)
		new_item.process_input
		puts new_item
		@list << new_item
	end

	def to_s
		puts "shoplist: #{@list}"
	end
end

my_list = Rolodex.new
my_list.add_item
puts my_list