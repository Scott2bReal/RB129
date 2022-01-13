# Why is it generally safer to invoke a setter method (if available) vs.
# referencing the instance variable directly when trying to set an instance
# variable within the class? Give an example.

class BankAccount
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def balance=(new_balance)
    if new_balance >= 0
      @balance = new_balance 
    else
      puts "Sorry, balance can't be less than 0"
    end
  end

  def withdraw(amount)
    self.balance = balance - amount
  end
end

acct = BankAccount.new(50)
p acct.balance    # => 50
acct.withdraw(10)
p acct.balance    # => 40
acct.withdraw(50) # => Sorry, balance can't be less than 0
p acct.balance    # => 40

# It's good practice to invoke a setter method rather than directly reference
# an instance variable because a setter method can be used to implement, for
# example, some type of safeguard against setting the instance variable to an
# unwanted value. In the above example, the bank account should not have a
# balance less than zero. In BankAccount#withdraw, the setter method is called
# to reassign @balance to the return value of balance - amount. If that value is
# 0, it will print an error message and will not execute the withdrawl. Had the
# instance variable been referenced directly instead of the setter method, it
# would be possible to assign @balance to a value less than 0
