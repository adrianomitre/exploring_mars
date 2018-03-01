# Parse plateau and probe specs, as well as probe commands.
#
module Parser
  CHAR_TO_COMMAND = {
    'L' => :turn_left,
    'R' => :turn_right,
    'M' => :move_forward
  }.freeze

  def self.parse_commands(line)
    validate_syntax_for_commands(line)
    line.gsub(/\s/, '').each_char.map { |c| CHAR_TO_COMMAND[c] }
  end

  def self.parse_position(line)
    validate_syntax_for_position_with_optional_direction(line)
    fields = line.split
    Vector[*fields.first(2).map(&:to_i)]
  end

  def self.parse_direction(line)
    validate_syntax_for_position_with_optional_direction(line)
    orientation_first_letter = line.split.last
    regexp = Regexp.new('^' + orientation_first_letter)
    Probe::ORIENTATION_NAME_TO_DIRECTION.find { |name, _| regexp =~ name }.last
  end

  def self.validate_syntax_for_commands(line)
    unless line[/^[lrm ]*$/i]
      raise(ArgumentError, 'invalid syntax for commands')
    end
  end

  def self.validate_syntax_for_position_with_optional_direction(line)
    unless line[/^\s*\d+\s\d+(?:\s+[ENWS])?\s*$/]
      raise(ArgumentError, 'invalid syntax for position w/ opt. direction')
    end
  end
end
