# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/6'

class GiantSquidTest < Minitest::Test
  def setup
    @giant_squid = GiantSquid.new
    @test_data = File.read("#{File.dirname(__FILE__)}/input.txt")
  end
end
