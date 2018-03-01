# Parse plateau and probe specs, as well as probe commands.
#
module Parser
  CHAR_TO_COMMAND = {
    'L' => :turn_left,
    'R' => :turn_right,
    'M' => :move_forward
  }.freeze

  def self.parse_commands(line)
    line.gsub(/[^lrm]/i, '').each_char.map { |c| CHAR_TO_COMMAND[c] }
  end

  def self.parse_position(line)
    fields = line.split
    Vector[*fields.first(2).map(&:to_i)]
  end

  def self.parse_direction(line)
    orientation_first_letter = line.split.last
    regexp = Regexp.new('^' + orientation_first_letter)
    Probe::ORIENTATION_NAME_TO_DIRECTION.find { |name, _| regexp =~ name }.last
  end
end
