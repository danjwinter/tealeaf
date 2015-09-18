puts "please enter a number from 0 to 100"
x = gets.chomp.to_i

def num1(x)
if x < 0
  puts "That was negative and not what I asked for!"
elsif x < 51
  puts "Your number is between 0 and 50"
elsif x < 101
  puts "Your number is between 51 and 100"
else 
  puts "Your number is over 100!"
end
end

def num2(x)
  case
  when x < 0
    puts "That was negative and not what I asked for!"
  when x < 51
    puts "Your number is between 0 and 50"
  when x < 101
    puts "Your number is between 51 and 100"
  else 
    puts "Your number is over 100!"
  end
  end
  
  puts num1(x)
  puts num2(x)