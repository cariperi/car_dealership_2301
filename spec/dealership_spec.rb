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

    it 'starts with no cars in inventory by default' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory).to eq([])
    end
  end

  describe '#inventory_count' do
    it 'returns the total number of cars in the inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory_count).to eq(0)
    end
  end

  describe '#add_car' do
    it 'adds a specified car to the cars inventory array' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      dealership.add_car(car_1)

      expect(dealership.inventory_count).to eq(1)
      expect(dealership.inventory).to include(car_1)
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

  describe '#average_price_of_car' do
    it 'returns a formatted string with average price of all cars in inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.average_price_of_car).to be_a String
      expect(dealership.average_price_of_car).to eq("39,000")
    end
  end

  describe '#cars_sorted_by_price' do
    it 'returns an array with the entire inventory sorted by total cost' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_sorted_by_price).to be_a Array
      expect(dealership.cars_sorted_by_price.count).to eq(dealership.inventory_count)
      expect(dealership.cars_sorted_by_price.first).to eq(car_3)
    end
  end
end