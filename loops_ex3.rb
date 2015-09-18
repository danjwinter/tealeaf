arr = %w(apple, banana, pineapple, acai, strawberry)

arr.each_with_index {|item, index| puts "\##{index} index of #{item}" } 
