require 'matrix'

# Mars probe, as per the enunciate. Can turn left, right and move forward.
#
class Probe
  NAME_TO_DIRECTION = {
    EAST: 0,
    NORTH: Math::PI / 2,
    WEST: Math::PI,
    SOUTH: Math::PI * 3 / 2
  }.freeze

  attr_reader :position, :direction

  # Direction unit: radians
  #
  def initialize(position:, direction:)
    @position = position
    @direction = direction
  end

  def turn_left
    turn(-0.5 * Math::PI)
  end

  def turn_right
    turn(0.5 * Math::PI)
  end

  def move_forward(distance = 1)
    @position +=
      Vector[
        Math.cos(direction) * distance,
        Math.sin(direction) * distance
      ].map(&:round)
  end

  private

  def turn(degrees)
    @direction = (@direction - degrees) % (2 * Math::PI)
  end
end
