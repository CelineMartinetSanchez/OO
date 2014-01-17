class Transaction

  def initialize(amount, date)
    @amount = amount
    @date = date
  end
  
  def to_s
    "#{@date.strftime("%m/%d/%Y")} at #{@date.strftime("%H:%M")} - Amount: #{@amount}"
  end
end



    # if args[:password] == @password
    #   @transactions.each {|x| puts "#{x[1].strftime("%m/%d/%Y")} at #{x[1].strftime("%H:%M")} - Amount: #{x[0]}$"}
    # elsif args.empty?
    #   puts "No password given." 
    # else
    #   puts "Wrong password!"
    # end