class Dealership
  attr_reader :name, :address, :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    @inventory.count >= 1
  end

  def cars_by_make(make)
    @inventory.find_all { |car| car.make == make }
  end

  def total_value
    @inventory.map { |car| car.total_cost }.sum
  end

  def details
    details_hash = {}
    details_hash["total_value"] = total_value
    details_hash["address"] = @address
    details_hash
  end
end
