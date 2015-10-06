class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  TYPE = ''
  @@number_of_vehicles = 0
  
  def self.number_of_vehicles
    puts "this program has created #{@@number_of_vehicles} vehicles."
  end
  
  def initialize(c, m, y)
    @color = c
    @model = m
    @year = y
    @current_speed = 0
    @@number_of_vehicles += 1
  end
  
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def speed_up(number)
    @current_speed += (number)
    puts "you just sped up #{number}"
  end
  
  def brake(number)
    @current_speed -= number
    puts "you just decelerated #{number}"
  end
  
  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy."
  end
  
  def current_speed
    puts "Whoa! You're going #{@current_speed} mph."
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "you just spray painted that sucker #{new_color}."
  end
  
  def age
    "Your #{self.model} is #{years_old} years old."
  end
  
  private
  def years_old
    Time.now.year - self.year
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end
    


class MyCar < Vehicle
  include Towable
  NUMBER_OF_DOORS = 4
  
  def to_s
    "My car is a #{self.color} #{self.year} #{@model}."
  end
end


nissan = MyCar.new('white', '300zx', 1991)
nissan.speed_up(20)
nissan.current_speed
nissan.speed_up(50)
nissan.current_speed
nissan.brake(20)
nissan.current_speed
nissan.shut_off
nissan.current_speed
puts nissan.color
nissan.color = 'red'
puts nissan.color
puts nissan.year
nissan.spray_paint('neon orange')
puts nissan.color
MyCar.gas_mileage(13, 351)
puts nissan
puts nissan.can_tow?(1000)

puts MyCar.ancestors
puts nissan.age
