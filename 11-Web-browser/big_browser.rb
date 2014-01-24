require 'nokogiri'
require 'open-uri'

class Browser
  # Your code goes here

  def self.start
    yield(self.new)
  end

  def get(response)
    @my_new_page = Page.new(response)
  end

  def display
    @my_new_page.display
  end

end


class Page
  # and here ;)
  def initialize(url)
    @page = Nokogiri::HTML(open(url))
  end

  def display
    puts @page.inner_text.gsub(/\r|\t/, '')
  end

end


Browser.start do |browser|  # Comme b = Browser.new ; b.start
  # Loop until user wants to exit
  while true
    puts 'Where do you wanna go? (write "exit" if you want to exit)' 
    url = gets.chomp # Get URL from user (full url like 'http://www.google.fr')

    break if url == 'exit'

    # Fetch page content and display it
    page = browser.get(url)
    page.display
    puts "\n------------\n"
  end
  
  puts 'bye bye!'
end