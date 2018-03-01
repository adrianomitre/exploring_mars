# Plateau in Mars, does boundary verification.
#
class Plateau
  attr_reader :upper_rightmost_position

  def initialize(upper_rightmost_position)
    @upper_rightmost_position = upper_rightmost_position
  end

  def valid_command?(probe, command)
    return true unless command == :move_forward
    within_boundaries?(probe.dup.send(command))
  end

  def within_boundaries?(position)
    ranges.each_index.all? { |i| ranges[i].include?(position[i]) }
  end

  private

  def ranges
    [
      0..@upper_rightmost_position[0],
      0..@upper_rightmost_position[1]
    ]
  end
end
