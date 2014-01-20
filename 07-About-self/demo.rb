module DemoModule

  def self.introduce
    puts "3. self from module method : #{self.inspect} | #{self.class}"
  end

  class DemoClass  

    puts "1. self from class definition : #{self.inspect} | #{self.class}"

    def introduce
      @whatever = "whatever text"
      puts "5. self from instance method : #{self.inspect} | #{self.class}"
    end

    def self.introduce
      puts "4. self from class method : #{self.inspect} | #{self.class}"
    end    
  end

  puts "2. self from module definition : #{self.inspect} | #{self.class}"

end

DemoModule::introduce
DemoModule::DemoClass.introduce      
DemoModule::DemoClass.new.introduce