require_relative 'test_helper'

class TestPlateau < Minitest::Test
  def test_within_boundaries
    upper_rightmost_position = Vector[34, 56]
    plateau = Plateau.new(upper_rightmost_position)
    assert plateau.within_boundaries?(Vector[0, 0])
    assert plateau.within_boundaries?(upper_rightmost_position)
    assert !plateau.within_boundaries?(upper_rightmost_position + Vector[1, 0])
    assert !plateau.within_boundaries?(upper_rightmost_position + Vector[0, 1])
    assert !plateau.within_boundaries?(Vector[-1, 0])
    assert !plateau.within_boundaries?(Vector[0, -1])
  end
end
