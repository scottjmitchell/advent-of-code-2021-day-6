# frozen_string_literal: true

class GiantWhale
  def get_all_crab_positions(horizontal_positions)
    crab_positions = Hash.new

    horizontal_positions.each do |crab|
      if horizontal_positions.include?(crab)
        crab_positions[crab] = crab_positions[crab].to_i + 1 
      else
        crab_positions[crab] = 0
      end
    end
    crab_positions
  end

  def get_fuel_amount(horizontal_positions, end_position)
    fuel = 0
    crabs = get_all_crab_positions(horizontal_positions)

    crabs.each do |horizontal_position|
      
      if horizontal_position[0][0].to_i > end_position
        fuel += (horizontal_position[0][0].to_i - end_position) * horizontal_position[0][1].to_i
      else
        fuel += (end_position - horizontal_position[0][0].to_i) * horizontal_position[0][1].to_i
      end
    end

    fuel
  end

  def find_optimal_position(horizontal_positions)
    crabs = get_all_crab_positions(horizontal_positions)
    min = horizontal_positions
            .collect { |crab| crab.to_i}
            .min
    max = horizontal_positions
            .collect { |crab| crab.to_i}
            .max

    min_fuel = fuel_amount = get_fuel_amount(crabs, 0)
    position = 0

    for num in min..max
      fuel_amount = get_fuel_amount(crabs, num)

      if fuel_amount < min_fuel
        min_fuel = fuel_amount
        position = num
      end
    end

    min_fuel
  end

  # Part 2

  def get_fuel_amount_exponential(horizontal_positions, end_position)
    fuel = 0

    horizontal_positions.keys.each do |horizontal_position|
      crab_fuel = 0
      distance = 0

      if horizontal_position.to_i > end_position
        distance = (horizontal_position.to_i - end_position)
      else
        distance = (end_position - horizontal_position.to_i)
      end

      for step in 0..distance
        crab_fuel += step
      end


      fuel += crab_fuel * horizontal_positions[horizontal_position]
    end
    fuel
  end

  def find_optimal_position_exponential(horizontal_positions)
    crabs = get_all_crab_positions(horizontal_positions)
    min = horizontal_positions
            .collect { |crab| crab.to_i}
            .min
    max = horizontal_positions
            .collect { |crab| crab.to_i}
            .max

    min_fuel = fuel_amount = get_fuel_amount_exponential(crabs, 0)
    position = 0

    for num in min..max
      fuel_amount = get_fuel_amount_exponential(crabs, num)

      if fuel_amount < min_fuel
        min_fuel = fuel_amount
        position = num
      end
    end

    min_fuel
  end
end

data = File.read("#{File.dirname(__FILE__)}/input.txt").split(",")
gw = GiantWhale.new

# puts gw.find_optimal_position(data)
puts gw.find_optimal_position_exponential(data)


