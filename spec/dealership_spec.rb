require 'rspec'
require './lib/car'
require './lib/dealership'

describe Car do

  describe '#initialize' do
    it 'exists' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership).to be_a Dealership
    end

    it 'has a name' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.name).to eq("Acme Auto")
    end

    it 'has an address' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.address).to eq("123 Main Street")
    end

    it 'starts with no cars by default' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.cars).to eq([])
    end
  end

  describe '#has_inventory?' do
    it 'returns false when the dealership has no cars' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.has_inventory?).to be false
    end

    it 'returns true when the dealership has at least 1 car' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      dealership.add_car(car_1)

      expect(dealership.has_inventory?).to be true
    end

    it 'returns true when the dealership has many cars' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.has_inventory?).to be true
    end
  end

  describe '#add_car' do
    it 'adds a specified car to the cars inventory array' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      dealership.add_car(car_1)

      expect(dealership.cars.count).to eq(1)
      expect(dealership.cars).to include(car_1)
    end
  end

  describe '#cars_by_make' do
    it 'returns an array of cars with a specified make' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_by_make("Toyota")).to include(car_2, car_3)
      expect(dealership.cars_by_make("Toyota").count).to eq(2)
    end

    it 'does not include cars with a different make' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_by_make("Toyota")).not_to include(car_1)
    end
  end

  describe '#total_value' do
    it 'returns the total value of all cars in the inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.total_value).to eq(156000)
    end
  end

  describe '#details' do
    it 'returns a hash with dealership total value and address' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.details).to be_a Hash
      expect(dealership.details.keys).to include("total_value", "address")
      expect(dealership.details.values).to include(156000, "123 Main Street")
    end
  end
end