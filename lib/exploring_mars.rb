#!/usr/bin/env ruby

require_relative 'mars_exploration'

mars_exploration = MarsExploration.new
ARGF.each_with_index do |line, index|
  begin
    if index.zero?
      mars_exploration.process_plateau_definition(line)
    elsif index.odd?
      mars_exploration.process_probe_definition(line)
    else
      mars_exploration.process_probe_commands(line)
    end
  rescue ArgumentError => error
    STDERR.puts "#{error} on line #{index}"
  end
end
