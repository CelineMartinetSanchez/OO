require_relative "csv_manager"

class CookBook
  def initialize(file_name)
    @cookbook = CsvManager.new(file_name)
  end

  def recipes
    @cookbook.list    
  end

  def add_recipe(recipe_name)
    @cookbook.rows_array << [recipe_name]
  end
  def delete_recipe(index)
    @cookbook.rows_array.delete_at(index)
  end
  def quit
    @cookbook.inject_data_csv
  end

end