arr = ["laboratory", "experiment", "Pan's Labyrinth", "elaborate", "polar bear"]

arr.each do |x| 
  if /lab/ =~ x
  puts x
else
  puts "this word doesn't contain lab"
end
end