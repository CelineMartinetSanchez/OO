# This is how you define your own custom exception classes
require_relative 'transaction'

class DepositError < StandardError
end

class BankAccount
  attr_reader :name, :position
  
  MIN_DEPOSIT =  100
  
  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban
    
    add_transaction(initial_deposit)

  end
    
  def withdraw(amount)
    add_transaction(-amount)
    puts "You've just withdrawn #{amount}$. You have #{@position}$ on your account."
  end
  
  def deposit(amount)
    add_transaction(amount)
    puts "You've just made a #{amount}$ deposit. You have #{@position}$ on your account."
  end
  
  def transactions_history(args = {})

    if args[:password] == @password
    # your_transaction = Transaction.new(@transactions)
     @transactions.each {|amount| puts amount}

      # @transactions.each {|x| puts "#{x[1].strftime("%m/%d/%Y")} at #{x[1].strftime("%H:%M")} - Amount: #{x[0]}$"}
    elsif args.empty?
      puts "No password given." 
    else
      puts "Wrong password!"
    end
  end
  
  def iban
    # Partial getter (should hide the middle of the IBAN like FR14**************606)
    @iban = @iban.gsub(/\D((\d{4})(\D))+(\w+)\D/, "**************")
  end
  
  def to_s
    "Hello your Highest: #{@name},\nIBAN: #{iban},\nCurrent amount: #{@position}$."
    # Method used when printing account object as string (also used for string interpolation)
  end
          
  private  
  
  def add_transaction(amount)
    @position += amount
    @transactions << Transaction.new(amount, Time.now)
    # Main account logic
    # Should add the amount in the transactions array
    # Should update the current position
  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

# Accessible infos
puts account.name # => Bruce Lee
puts account.iban # => FR14**************606
puts account.position # => 200

# Nicely print account's infos (over-riding #to_s)
puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

# Make some transactions
account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

# Print transactions history with password
account.transactions_history({password: "brucelit"}) # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
begin
  too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
rescue DepositError => e
  puts e.message
end 