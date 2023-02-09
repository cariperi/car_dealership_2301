class Car
  attr_reader :make, :model, :monthly_payment, :loan_length, :total_cost
  attr_accessor :color #doesn't need to be here - reassigning in the same class, can be in attr_reader

  def initialize(make_model, monthly_payment, loan_length)
    @make = make_model.split(' ').first
    @model = make_model.split(' ').last
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @total_cost = @loan_length * @monthly_payment #could be a seperate method
    @color = nil
  end

  def paint!(color)
    return "Sorry! Please try again." if color.class != Symbol
    @color = color
  end
end
