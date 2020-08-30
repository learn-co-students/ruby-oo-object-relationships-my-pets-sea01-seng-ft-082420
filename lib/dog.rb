class Dog
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  #returns all instances of dog that have been created
  def self.all
    @@all
  end  
end