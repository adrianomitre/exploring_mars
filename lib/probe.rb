require 'matrix'

# Mars probe, as per the enunciate. Can turn left, right and move forward.
#
class Probe
  ORIENTATION_NAME_TO_DIRECTION = {
    EAST: 0.0,
    NORTH: Math::PI / 2,
    WEST: Math::PI,
    SOUTH: Math::PI * 3 / 2
  }.freeze

  attr_reader :position, :direction

  # Direction unit: radians
  #
  def initialize(position:, direction:, plateau: nil)
    @position = position
    @direction = direction
    @plateau = plateau
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

  def valid_command?(command)
    return true if command != :move_forward || @plateau.nil?
    @plateau.within_boundaries?(dup.move_forward)
  end

  private

  def turn(degrees)
    @direction = (@direction - degrees) % (2 * Math::PI)
  end
end
