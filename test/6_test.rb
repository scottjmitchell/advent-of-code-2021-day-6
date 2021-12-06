# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/6'

class LanternfishTest < Minitest::Test
  def setup
    @lanternfish = Lanternfish.new
    @test_data = File.read("#{File.dirname(__FILE__)}/input.txt")
  end

  def test_1_day
    assert @lanternfish.get_lanternfish_ages(@test_data, 1) == [2,3,2,0,1]
  end

  def test_2_days
    assert @lanternfish.get_lanternfish_ages(@test_data, 2) == [1,2,1,6,0,8]
  end

  def test_18_days
    assert @lanternfish.get_lanternfish_ages(@test_data, 18) == [6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8]
  end

  def test_18_days_count
    assert @lanternfish.get_number_of_lanternfish(@test_data, 80) == 5934
  end

  def test_18_days_optimised_count
    assert @lanternfish.get_number_of_lanternfish_optimised(@test_data, 80) == 5934
  end
end
