class Rover

	attr_accessor :x, :y, :direction

	def initialize(x, y, direction) 
		@x = x
		@y = y
		@direction = direction
	end

	def process_commands(commands)

		commands.split("").each do |command| 
			case command
				when 'M'
					move
				when 'R'
					turn_right
				when 'L'
					turn_left
			end	
		end
    end


	def move
		if @direction == "N"
			@y += 1
		elsif @direction == "E"
			@x += 1
		elsif @direction == "S"
			@y -= 1
		elsif @direction == "W"
			@x -= 1
		else
			puts "Error!"
		end
	end

	def turn_right
		if @direction == "N"
			@direction = "E"
		elsif @direction == "E"
			@direction = "S"
		elsif @direction == "S"
			@direction = "W"
		elsif @direction == "W" 
			@direction = "N"
		else
			puts "Error!"
		end
	end

	def turn_left
		if @direction == "N"
			@direction = "W"
		elsif @direction == "W"
			@direction = "S"
		elsif @direction == "S"
			@direction = "E"
		elsif @direction == "E"
			@direction = "N"
		else
			puts "Error!"
		end
	end

	def to_s
		"The current position of rover is (#{@x}, #{@y}, #{@direction})."
	end
end

# def make_new_rover
# 	puts "where do you want your rover to start?"
# 	puts "Enter a x coordinate:"
# 	x = gets.chomp.to_i
# 	puts "Enter a y coordinate:"
# 	y = gets.chomp.to_i
# 	puts "give a direction:"
# 	direction = gets.chomp
# 	rover = Rover.new(x, y, direction)
# 	puts rover

# 	puts "what command do you want to give?"
# 	puts "--'M' to move forward."
# 	puts "--'L' to turn left."
# 	puts "--'R' to turn right."
#     puts "--example LMRLMRRR"

#     commands = gets.chomp

# 	rover.process_commands(commands)
# end

# make_new_rover
# make_new_rover

class Plateau 
	def initialize(width, height)
		@width = width
		@height = height
		@rovers = []
	end

	def add_rover(x, y, direction)
		if x > @width or x < 0 or y > @height or y < 0
			puts "THIS IS NOT ON THE PLATEAU!!! OMG"
		else
			new_rover = Rover.new(x, y, direction)
			@rovers << new_rover
		end
	end

	def command_rover
		puts "what rover do you want to command."
		puts "--Enter '1' for rover 1"
		puts "--Enter '2' for rover 2"
		user_input = gets.chomp.to_i


		puts "what command do you want to give?"
		puts "--'M' to move forward."
		puts "--'L' to turn left."
		puts "--'R' to turn right."
	    puts "--example LMRLMRRR"

	    commands = gets.chomp
	    @rovers[user_input - 1].process_commands(commands)

	end

	def to_s
		"Width: #{@width}, Height: #{@height}, Rovers: \n\n#{@rovers.map{|r| r.to_s}}"
	end
end

my_plat = Plateau.new(10,10)
my_plat.add_rover(1, 2, "N")
my_plat.add_rover(3, 3, "E")
puts my_plat
my_plat.command_rover
puts my_plat
my_plat.command_rover
puts my_plat

