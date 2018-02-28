require_relative 'test_helper'
require 'minitest/autorun'

class TestProbe < Minitest::Test
  def setup
    @initial_position = Vector[0, 0]
    @initial_direction = Probe::NAME_TO_DIRECTION[:NORTH]
    @probe = Probe.new(
      position: @initial_position,
      direction: @initial_direction
    )
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
    @probe.turn_left until @probe.direction == Probe::NAME_TO_DIRECTION[:NORTH]
  end
end
