class People
	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi, my name is #{@name}."
	end
end		

class Student < People
    def learn
		puts "I get it!"
	end
end

class Instructor < People
	def teach
		puts "Everything in Ruby is an Object."
	end
end

instructor = Instructor.new("Chris")
instructor.greeting
instructor.teach
student = Student.new("Cristina")
student.greeting
student.learn
#student.teach
#the reason why student.teach doesn't work is we dont have a learn method in our Student class.
