require("dealership")
require("vehicle")
require("rspec")
require("pry")

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it('returns the dealership name') do
      test_dealership = Dealership.new("Bob's Cars")
      expect(test_dealership.name()).to(eq("Bob's Cars"))
    end
  end

  describe('#id') do
    it('returns the id of the dealership') do
      test_dealership = Dealership.new("Bob's Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it('returns an empty array of cars for the dealership') do
      test_dealership = Dealership.new("Bob's Cars")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a dealership to the array of dealerships') do
      test_dealership = Dealership.new("Bob's Cars")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.all') do
    it('empty at first') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('will clear the dealerships array') do
      test_dealership = Dealership.new("Bob's Cars")
      test_dealership.save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a dealership by its id number') do
      test_dealership = Dealership.new("Bob's Cars")
      test_dealership.save()
      test_dealership2 = Dealership.new("Linda's Cars")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe('#add_vehicle') do
    it('adds a vehicle to a dealership') do
      test_dealership = Dealership.new("Bob's Cars")
      test_vehicle = Vehicle.new({:make=>"Toyota", :model => "Prius", :year => 2000, :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end
