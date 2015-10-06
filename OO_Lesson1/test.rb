class Person
  attr_accessor :name, :first_name, :last_name
  
  def initialize(name)
    @name = name
  end  
  
  def name
    name = first_name + last_name
  end
end

bob = Person.new('bob')
puts bob.name
bob.name = 'Robert'
puts bob.name