require 'rspec'
require './lib/car'

RSpec.describe Car do
  it 'exists' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car).to be_a Car
  end

  it 'has a make' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car.make).to eq("Ford")
  end

  it 'has a model' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car.model).to eq("Mustang")
  end

  it 'has a monthly payment' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car.monthly_payment).to eq(1500)
  end

  it 'has a loan length' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car.loan_length).to eq(36)
  end

  it 'has a total cost' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car.total_cost).to eq(54000)
  end

  it 'starts with no color by default' do
    car = Car.new("Ford Mustang", 1500, 36)

    expect(car.color).to be nil
  end

  it 'can change color to a specified color' do #make this more explicit to the method:  'paints the car'
    car = Car.new("Ford Mustang", 1500, 36)
    car.paint!(:blue)

    expect(car.color).to eq(:blue)
  end

  it 'returns an error and does not change color if color is not a symbol' do
    car = Car.new("Ford Mustang", 1500, 36)
    car.paint!(:blue)
    car.paint!("test")

    expect(car.color).to eq(:blue)
    expect(car.paint!("blue")).to eq("Sorry! Please try again.")
  end
end
