require 'simplecov'
SimpleCov.start
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative '../lib/probe'
require_relative '../lib/plateau'
require 'minitest/autorun'

module TestHelpers
  MAX_COORDINATE_VALUE = 2**10
  INNER_LOOP_ITERATIONS = 2**8
  OUTER_LOOP_ITERATIONS = 2**8

  def rand_non_negative_position
    Vector[rand_coordinate_value, rand_coordinate_value]
  end

  def rand_outside_position(plateau)
    Vector[
      rand_outside_range(0..plateau.upper_rightmost_position[0]),
      rand_outside_range(0..plateau.upper_rightmost_position[1])
    ]
  end

  def rand_outside_range(range)
    if rand < 0.5
      range.first - rand_coordinate_value
    else
      range.last + rand_coordinate_value
    end
  end

  def rand_coordinate_value
    rand(MAX_COORDINATE_VALUE)
  end
end
