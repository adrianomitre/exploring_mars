require_relative 'test_helper'

class TestProbe < Minitest::Test
  include TestHelpers

  def setup
    @initial_position = Vector[0, 0]
    @initial_direction = Probe::ORIENTATION_NAME_TO_DIRECTION[:NORTH]
    @probe = Probe.new(
      position: @initial_position,
      direction: @initial_direction
    )
  end

  def test_valid_command
    plateau = Plateau.new(rand_non_negative_position)
    probe =
      Probe.new(
        plateau: plateau,
        position: plateau.upper_rightmost_position,
        direction: Probe::ORIENTATION_NAME_TO_DIRECTION[:NORTH]
      )
    2.times do
      assert !probe.valid_command?(:move_forward)
      probe.turn_right
    end
    2.times do
      assert probe.valid_command?(:move_forward)
      probe.turn_right
    end
  end

  def test_turn_left
    ensure_headed_north
    @probe.turn_left
    @probe.move_forward
    assert_equal @initial_position - Vector[1, 0], @probe.position
  end

  def test_turn_right
    ensure_headed_north
    @probe.turn_right
    @probe.move_forward
    assert_equal @initial_position + Vector[1, 0], @probe.position
  end

  def test_rotate_full_circle
    4.times { @probe.turn_left }
    assert_equal @initial_direction, @probe.direction
    8.times { @probe.turn_right }
    assert_equal @initial_direction, @probe.direction
  end

  def test_back_and_forth
    @probe.move_forward
    2.times { @probe.turn_left }
    @probe.move_forward
    assert_equal @initial_position, @probe.position
  end

  private

  def ensure_headed_north
    until @probe.direction == Probe::ORIENTATION_NAME_TO_DIRECTION[:NORTH]
      @probe.turn_left
    end
  end
end
