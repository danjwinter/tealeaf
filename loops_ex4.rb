def count_down(x)
  if x > 0
    puts x 
    count_down(x - 1)
else
  puts 0
end
end

count_down(8)
  