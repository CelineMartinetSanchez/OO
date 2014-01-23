require_relative "cookbook"
require_relative "csv_manager"
#afficher la liste d'un doc CSV


cookbook = CookBook.new("recipe.csv")
puts "Je viens de créer un nouveau cookbook !"
p cookbook

puts "\nEn voici les recettes:"
cookbook.recipes

recipe_name = "Bavarois aux fraises"
cookbook.add_recipe(recipe_name)

puts "\nEt un Bavarois aux fraises en plus !"
cookbook.recipes

puts "\ Vous venez de supprimer un recipe"
cookbook.delete_recipe(4)

cookbook.recipes
cookbook.quit

# File.open("recipes.csv", "w") do |file|
#   doc.search('.m_search_result_part4').each do |element|
#     file.write element
#   end
# end







# array = []
#     CSV.foreach("recipe.csv") do |line|
#       array << line
#     end
# p array

#supprimer une recette
