
class Receipt

	def self.run
		my_sales = new
		my_sales.main_menu
	end

	def initialize
		@item_list = []
	end

	def main_menu
		while true
			print_main_menu
			user_selection = gets.chomp.to_i
			call_selection(user_selection)
		end
	end

	def print_main_menu
		puts "[1] to input item"
		puts "[2] to output result"
		puts "[3] to exit"
	end

	def call_selection(user_selection)
		input_item if user_selection == 1
		output_result if user_selection == 2
		exit_program if user_selection == 3
	end

	def input_item
		puts "Enter the quantity of item:"
		qty = gets.chomp.to_i
		puts "Enter the name of item:"
		item = gets.chomp
		puts "Enter the price:"
		price = gets.chomp.to_f
		puts "Enter the type of the good: "
		puts "-- '1' for general goods"
		puts "-- '2' for exemption goods(book, food, medical products)"
		puts "-- '3' for imported goods"
		type = gets.chomp.to_i
		good = Item.new(qty, item, price, type)
		@item_list << good
		puts "The item has been added to the list."
	end


	def output_result
		total_sales_tax = 0
		total_price = 0
		my_list = @item_list.each do |item|
			puts item
			price = item.price.round(2)
			sales_tax = item.tax.round(2)
			total_sales_tax += sales_tax
			total_price += (price + sales_tax)
		end
		puts "sales tax: #{total_sales_tax.round(2)}"
		puts "total: #{total_price.round(2)}"
	end

	def exit_program
		exit
	end
end

class Item
	
	attr_accessor :qty, :item, :price, :type

	def initialize(qty, item, price, type)
		@qty = qty
		@item = item
		@price = price
		@type = type
	end

	def tax
		case @type
		when 1
			(@qty * @price * 0.1).round(2)
		when 2
			0
		when 3
			(@qty * @price * 0.15).round(2)
		end	
	end

	def total 
		(@price + tax).round(2)
	end

	def to_s
		puts "item: #{@qty} #{@item}, original price: #{@price.round(2)}, tax: #{tax}, price with tax: #{total}"
	end
end


Receipt.run


