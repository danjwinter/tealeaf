def mathfun(num)
  t = num / 1000
  h = num % 1000 / 100
  e = num % 1000 % 100 / 10
  o = num % 1000 % 100 % 10
  puts "thousands are #{t}"
  puts "hundreds are #{h}"
  puts "tens are #{e}"
  puts "ones are #{o}"
  
end

puts mathfun(3865)
  