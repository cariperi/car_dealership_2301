class Dealership
  attr_reader :name, :address, :cars

  def initialize(name, address)
    @name = name
    @address = address
    @cars = []
  end

  def has_inventory?
    @cars.count >= 1
  end

  def add_car(car)
    @cars << car
  end

  def cars_by_make(make)
    @cars.find_all { |car| car.make == make }
  end

  def total_value
    @cars.map { |car| car.total_cost }.sum
  end

  def details
    details_hash = {}
    details_hash["total_value"] = total_value
    details_hash["address"] = @address
    details_hash
  end
end
