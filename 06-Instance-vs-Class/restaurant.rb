class Restaurant

	@global_rating = []

	class << self
		attr_accessor :global_rating 

		def avg_rating
			Restaurant.global_rating.inject { |sum, element| sum + element}.to_i / Restaurant.global_rating.size
		end
	end
  
	def initialize(name, address, rating, type_of_food)
		@name = name
		@address = address
		@type_of_food = type_of_food
		@ratings = []
		@ratings << rating
		Restaurant.global_rating << rating
	end

	def number_of_ratings
		@ratings.count
	end

	def avg_rating
		@ratings.inject { |sum, element| sum + element}.to_i / @ratings.size
	end

	def rate(rating)
		@ratings << rating
		return rating
	end 

end

fauchon = Restaurant.new("Fauchon", "rue", 5, "nice food")
p fauchon.number_of_ratings
p fauchon.avg_rating
# Test : un nouveau rate s'ajoute aux autres, l'average rating se met à jour ainsi que le number of ratings. 
p fauchon.rate(8)
p fauchon.number_of_ratings
p fauchon.avg_rating

chinois = Restaurant.new("Chinois", "ailleurs", 7, "Asiatique")
p Restaurant.avg_rating

indonesien = Restaurant.new("Indonesien", "Fort fort lointain", 2, "Asiatique")
p Restaurant.avg_rating