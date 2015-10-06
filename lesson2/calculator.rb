def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

prompt("Welcome to Calculator!")
name = ''
loop do
  prompt("What's your name?")
  name = gets.chomp
  if name.empty?()
    prompt("say what?")
  else
    break
  end
end

prompt("Hi #{name.reverse}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Whachu talkin' bout Willis?! Give me a number!")
    end
  end

  prompt("the number is #{number1}")

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("That ain't what I'm talkin' 'bout!")
    end
  end

  prompt("the number is #{number2}")

  operator = ''
  result = ''

  prompt("What operation would you like to perform?
  1 = add, 2 = subtract,4 = multiply, 4 = divide")
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("that aint it, try again with a number 1 - 4")
    end
  end

  case
  when operator == '1'
    result = number1.to_i + number2.to_i

  when operator == '2'
    result = number1.to_i - number2.to_i

  when operator == '3'
    result = number1.to_i * number2.to_i

  when operator == '4'
    result = number1.to_f / number2.to_f

  else
    prompt("that wasn't an option. you fail.")

  end

  prompt("the answer you seek is #{result}")

  prompt("Would you like to calculate again? (Y)")
  ans = gets.chomp
  break if ans.downcase != "y"
end
