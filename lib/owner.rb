require 'pry'
class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  #say its species
  def say_species
    return "I am a #{@species}."
  end

  #returns all instances of Owner that have been created
  def self.all
    @@all
  end

  #returns the number of owners that have been created
  def self.count
    count = 0
    self.all.each do |owner|
      count += 1
    end
    count
  end

  #reset the owners that have been created
  def self.reset_all
    @@all.clear
  end

  #returns a collection of all the cats that belong to the owner
  def cats
    Cat.all.select do |cats|
      cats.owner == self
    end
  end

  #returns a collection of all the dogs that belong to the owner
  def dogs
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end

  #can buy a cat that is an instance of the Cat class
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  #can buy a dog that is an instance of the Dog class
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  #walks the dogs which makes the dogs' moods happy
  def walk_dogs
    dogs.each do |doggos|
      doggos.mood = "happy"
    end
  end

  #feeds cats which makes the cats' moods happy
  def feed_cats
    cats.each do |kitties|
      kitties.mood = "happy"
    end
  end

  #can sell all its pets, which makes them nervous
  #can sell all its pets, which leaves them without an owner
  def sell_pets
    cats.map do |pets|
      pets.owner = nil
      pets.mood = "nervous"
    end
    dogs.map do |pets|
      pets.owner = nil
      pets.mood = "nervous"
    end
  end

  #can list off its pets
  def list_pets
    return "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end