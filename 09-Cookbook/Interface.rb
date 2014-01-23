require_relative "cookbook"

"-- My CookBook--"
text = "What do you wanna do ?\n
- List all recipes [Press 1]
- Add a recipe [Press 2]
- Delete a recipe [Press 3]
- Exit [Press 4]"

cookbook = CookBook.new("recipe.csv")

while true
  puts text
  answer = gets.chomp
  case answer
    when "1"
     cookbook.recipes
    when "2"
      puts "which recipe do you want to add ?"
      recipe_answer = gets.chomp
      cookbook.add_recipe(recipe_answer)
      puts "Thank you for your addition, ur awesome!!"
    when "3"
      cookbook.recipes
      puts "Please enter the index of the recipe"
      index = gets.chomp.to_i
      cookbook.delete_recipe(index)
      puts "You just have deleted a recipe"
  end 
  
  break if answer == "4"
  cookbook.quit
end

