require 'csv'

# def print_with_index(line)
# 	line.each_with_index {|line, index| puts "#{index} - #{line[0]}"}
# end

# # Print CSV content

# CSV.open("recipes_try.csv") do |line|
# 	print_with_index(line)
# end

# # Add a line
# CSV.open("recipes_try.csv", "a+") do |csv|
# 	csv << ["my second new string"]
# end

# # Delete a line
# def delete(index)
# 	array = []
# 	CSV.foreach("recipes_try.csv") do |line|
# 		array << line
# 	end

# 	array.delete_at(index)

# 	CSV.open("recipes_try.csv", "wb") do |csv|
# 	csv << array
# 	end

# end

# delete

	array = []
	CSV.foreach("recipes_try.csv") do |line|
		array << line
	end
	p array

# CSV.open("recipes_try.csv", "ab") do |csv|
#   csv << ["my new recipe"]
# end

# arr_of_arrs.each_with_index do |e, i|
#   next if i == 0

#   #process each row here
# end

