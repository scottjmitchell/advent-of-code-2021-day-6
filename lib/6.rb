# frozen_string_literal: true

class Lanternfish
  def get_lanternfish_ages(data, days)
    ages = data.split(",").collect { |age| age.to_i }

    days.times { ages = move_forward_a_day(ages) }

    ages
  end

  def move_forward_a_day(ages)
    ages_1_day_later = ages.collect { |age| age - 1}
    new_births = 0

    new_ages = ages_1_day_later.collect do |age| 
      if age == -1
        new_births += 1
        age = 6 
      else
        age
      end
    end

    add_new_births = new_births.times { new_ages << 8 }
    new_ages
  end

  def get_number_of_lanternfish(data, days)
    get_lanternfish_ages(data, days).length
  end

  def get_number_of_lanternfish_optimised(data, days)
    ages = data.split(",").collect { |age| age.to_i }
    generations = Hash.new

    ages.each {|age| generations[age.to_s] = generations[age.to_s].to_i + 1}
    
    counter = 0
    days.times {
      
      while counter <= 8
        generations["babies"] = generations[counter.to_s] if counter == 0
        generations["0"] = generations[counter.to_s] if counter == 1
        generations["1"] = generations[counter.to_s] if counter == 2
        generations["2"] = generations[counter.to_s] if counter == 3
        generations["3"] = generations[counter.to_s] if counter == 4
        generations["4"] = generations[counter.to_s] if counter == 5
        generations["5"] = generations[counter.to_s] if counter == 6
        generations["6"] = generations[counter.to_s] if counter == 7
        generations["7"] = generations[counter.to_s] if counter == 8
        counter += 1
      end
  
      generations["8"] = generations["babies"]
      generations["6"] = generations["6"].to_i + generations["babies"].to_i
      generations["babies"] = 0

      counter = 0
    }

    generations.values.sum
  end
end

data = File.read("#{File.dirname(__FILE__)}/input.txt")
lf = Lanternfish.new
puts lf.get_number_of_lanternfish(data, 80)
puts lf.get_number_of_lanternfish_optimised(data, 256)
