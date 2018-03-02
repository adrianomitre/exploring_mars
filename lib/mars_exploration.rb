require_relative 'probe'
require_relative 'plateau'
require_relative 'parser'
require_relative 'reporter'

# Process input lines.
#
class MarsExploration
  def process_plateau_definition(line)
    @plateau = Plateau.new(Parser.parse_position(line))
  end

  def process_probe_definition(line)
    @probe =
      Probe.new(
        plateau: @plateau,
        position: Parser.parse_position(line),
        direction: Parser.parse_direction(line)
      )
  end

  def process_probe_commands(line)
    commands = Parser.parse_commands(line)
    commands.each do |cmd|
      unless @probe.valid_command?(cmd)
        raise(ArgumentError, "Invalid command #{cmd}, skipping probe")
      end
      @probe.send(cmd)
    end
    Reporter.report_current_position(@probe)
  end
end
