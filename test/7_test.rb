# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/6'

class GiantWhaleTest < Minitest::Test
  def setup
    @giant_whale = GiantWhale.new
    @test_data = File.read("#{File.dirname(__FILE__)}/input.txt")
  end

  
end
