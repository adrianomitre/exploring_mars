# Report probe current position and orientation.
#
module Reporter
  def self.report_current_position(probe)
    position = probe.position
    orientation_first_letter =
      Probe::ORIENTATION_NAME_TO_DIRECTION
      .invert[probe.direction]
      .to_s
      .chars
      .first
    puts [position[0], position[1], orientation_first_letter].join(' ')
  end
end
