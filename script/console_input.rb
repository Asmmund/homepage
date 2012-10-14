# creating class with initial params defined via console
class ConsoleInput
  def initialize param
    puts " coustructing w\\ param #{param.inspect}"
    param.times do |i|
      puts i
    end
  end
end
puts "Please enter a number "
num = gets
obj = ConsoleInput.new(num.to_i)
