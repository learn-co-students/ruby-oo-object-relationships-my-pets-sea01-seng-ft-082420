require 'pry'
class Cat
  
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end

# steve = Owner.new("Steve")
# ix = Owner.new("Ix")
# yuki = Dog.new("Yuki", steve)
# gw = Dog.new("GW", steve)
# rose = Dog.new("Rose", ix)

# binding.pry
# 0