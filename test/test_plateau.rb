require_relative 'test_helper'

class TestPlateau < Minitest::Test
  MAX_COORDINATE_VALUE = 2**10
  INNER_LOOP_ITERATIONS = 2**8
  OUTER_LOOP_ITERATIONS = 2**8

  def test_within_boundaries_simplest
    plateau = Plateau.new(Vector[0, 0])
    assert plateau.within_boundaries?(Vector[0, 0])
  end

  def test_within_boundaries_generative
    OUTER_LOOP_ITERATIONS.times do
      plateau = Plateau.new(rand_non_negative_position)
      INNER_LOOP_ITERATIONS.times do
        rand_position = rand_outside_position(plateau)
        assert !plateau.within_boundaries?(rand_position)
      end
    end
  end

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
