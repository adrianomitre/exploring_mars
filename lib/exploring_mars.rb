#!/usr/bin/env ruby

require_relative 'probe'
require_relative 'plateau'
require_relative 'parser'
require_relative 'reporter'

plateau = nil # for scope
probe = nil # for scope
ARGF.each_with_index do |line, index|
  begin
    if index.zero?
      plateau = Plateau.new(Parser.parse_position(line))
    elsif index.odd?
      probe =
        Probe.new(
          plateau: plateau,
          position: Parser.parse_position(line),
          direction: Parser.parse_direction(line)
        )
    else
      begin
        commands = Parser.parse_commands(line)
        commands.each do |cmd|
          unless probe.valid_command?(cmd)
            raise "Invalid command #{cmd} on line #{index}. Skipping probe..."
          end
          probe.send(cmd)
        end
        Reporter.report_current_position(probe)
      rescue RuntimeError => error
        STDERR.puts error
      end
    end
  rescue ArgumentError => error
    STDERR.puts "#{error} on line #{index}"
  end
end
