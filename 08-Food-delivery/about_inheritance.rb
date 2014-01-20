class Dessert
	attr_accessor :name, :calories

	def initialize(name, calories)
		@name = name
		@calories = calories
	end

	def healthy?
		@calories < 200 ? true : false
	end

	def delicious?
		self.class == Dessert ? true : false
	end

end

class JellyBean < Dessert
	attr_accessor :flavor

	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end

	def delicious?
		@flavor == "black licorice" ? false : true
		
	end

end

cookie = Dessert.new("cookie", 700)
p cookie.healthy? #=> false
p cookie.delicious? #=> true
yogurt = Dessert.new("yogurt", 80)
p yogurt.healthy? #=> true
p yogurt.delicious? #=> true

jelly = JellyBean.new("jelly", 100, "black licorice")
p jelly.healthy? #=> true
p jelly.delicious? #=> false

syrup = JellyBean.new("syrup", 150, "sweet")
p syrup.healthy?
p syrup.delicious?