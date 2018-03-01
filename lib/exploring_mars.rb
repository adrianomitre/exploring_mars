#!/usr/bin/env ruby

require_relative 'probe'
require_relative 'parser'
require_relative 'reporter'

probe = nil # for scope
ARGF.each_with_index do |line, index|
  next if index.zero? # TODO: implement plateau dimensions
  if index.odd?
    probe =
      Probe.new(
        position: Parser.parse_position(line),
        direction: Parser.parse_direction(line)
      )
  else
    commands = Parser.parse_commands(line)
    commands.each { |cmd| probe.send(cmd) }
    # p commands
    Reporter.report_current_position(probe)
    # p probe
  end
end
