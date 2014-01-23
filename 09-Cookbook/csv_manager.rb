require "csv"
require_relative "cookbook"

class CsvManager

  attr_reader :rows_array
  def initialize(file_name)
    @file_name = file_name
    @rows_array = CSV.read(file_name)
    # CSV.foreach(file_name) do |line|
    #   @array << line
    # end
    #return @array
  end

  def list
    @rows_array.each_with_index {|row, index| puts "#{index}. #{row[0]}"}
  end

  def inject_data_csv
    CSV.open(@file_name, "wb") do |file|
    @rows_array.each do |element|
      file << element
      end
    end
  end

  def creates_data_csv
    CSV.open("@file_name", "wb") do |file|
    @rows_array.each do |element|
      file << element
      end
    end
  end
end