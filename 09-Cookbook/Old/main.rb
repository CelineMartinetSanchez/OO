require 'csv'
# J'affiche la liste contenue dans un fichier CSV. [list]

@recipes = []

def send_to_csv
	CSV.foreach("recipes_try.csv") do |line|
		@recipes << line
	end
end
# J'affiche le contenu d'un fichier CSV avec l'index.
puts "Ceci est le contenu de mon fichier initial."


def show_recipes
	@recipes.each_with_index {|line, index| puts "#{index} - #{line[0]}"}
end

puts show_recipes
# J'ajoute une recette à la fin d'un fichier CSV. [add]

def new_(recipe)
	@recipes << [recipe]
	CSV.open("recipes_try.csv", "wb") do |csv|
	  csv << @recipes
	end
end

puts "\nCeci est le nouveau contenu, avec une nouvelle recette ajoutée."
puts show_recipes

# # Je supprime une recette d'un fichier CSV. [del <recipe_id>]
def delete_recipe_at(index)
	@recipes.delete_at(index)
	send_to_csv
end
puts "\n Je viens de supprimer la dernière ligne."
puts @recipes

# # Exit [Esc.]
# break if answer = nil