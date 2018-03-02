require_relative 'test_helper'

class TestPlateau < Minitest::Test
  include TestHelpers

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
end
