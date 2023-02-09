class Dealership
  attr_reader :name, :address, :inventory #don't actually needs address and name here! if you just use @var

  def initialize(name, address)
    @name = name #don't need to add to attr_reader until it shows up in int pattern
    @address = address #don't need to add to attr_reader until it shows up in int pattern
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    @inventory.count >= 1  #could do inventory_count > 0
  end

  def cars_by_make(make)
    @inventory.find_all { |car| car.make == make }
  end

  def total_value
    @inventory.map { |car| car.total_cost }.sum #can use ".sum" enumerable alone on @inventory!
  end

  def details
    details_hash = {}
    details_hash["total_value"] = total_value
    details_hash["address"] = @address
    details_hash
  end

  def average_price_of_car
    format_number(total_value / inventory_count)
  end

  def cars_sorted_by_price
    @inventory.sort_by{ |car| car.total_cost }
  end

  def inventory_hash
    inventory_hash = {}
    @inventory.each do |car|
      inventory_hash[car.make] = cars_by_make(car.make)
    end
    inventory_hash
  end

  def format_number(number)
    num_groups = number.to_s.chars.to_a.reverse.each_slice(3)
    num_groups.map{|num_chunk| num_chunk.join}.join(',').reverse
  end
end
