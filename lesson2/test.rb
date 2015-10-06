def float?(x)
  x.to_f.to_s == x
end

def valid_number?(x)
  x.to_i.to_s == x || x.to_f.to_s == x
end

puts "Welcome to the payments you'll be making for life!"

loop do
  l = ''
  loop do
    puts "what is the loan amount?"
    l= gets.chomp
    
    if valid_number?(l)
      break
    end
    
  end

  apr = ''
  c = ''
  loop do
  puts "what about the APR?"
  apr = gets.chomp
  c = (apr.to_f / 100) / 12
  
  if valid_number?(apr)
    break
  end
  end
  
  years = ''
  n = ''
  loop do
  puts "how many years are you are you thinking?"
  years = gets.chomp
  n = years.to_f * 12
  
  if valid_number?(years)
    break
  end
  end



  p = l.to_f * (c * (1 + c)**n) / (((1 + c)**n) - 1)

  p p
  
  puts "Do you want another loan calculation? (Y) (N)"
  another = gets.downcase.chomp
  break unless another == "y"
end