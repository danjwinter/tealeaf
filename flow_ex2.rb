def caps(word)
  if word.length > 10
    word = word.upcase!
   
  else
    puts "#{word} is less than 10 characters"
  end
end

puts caps("frank")
puts caps("franklin delano roosevelt")