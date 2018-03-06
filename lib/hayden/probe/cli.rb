require 'thor'
require 'hayden/probe'

module Hayden
  module Probe
    class CLI < Thor
      option :x, type: :numeric, required: true
      option :y, type: :numeric, required: true
      desc 'surface', 'Creates a surface with X columns and Y lines'
      def surface
        upper_right_coordinate = Hayden::Probe::Core::Coordinate.new(options[:x], options[:y])
        @surface = Hayden::Probe::Core::Surface.new(upper_right_coordinate)
        say("A surface with #{options[:x]} rows and #{options[:y]} lines has been created")

        type_probe_informations

        should_continue_or_quit
      end

      private

      def type_probe_informations
        say('Please, inform the probe positions and direction')
        x = ask('Coordinate X:')
        y = ask('Coordinate Y:')
        direction = ask('Direction (N/S/E/W):')
        probe = create_probe(x, y, direction)

        say('Please, inform the sequence of movements that the probe should do')
        say('Ex: If you wish the probe to turn Left, Move forward, turn Left again, Move forward twice')
        say('You should type the following sequence: LMLMM')
        say('Movements alloweds: M = Move forward, L = Turn Left, R = Turn Right')
        move_list = ask('Movements sequence:').split('').map(&:to_s).map(&:downcase).map(&:to_sym)

        result = @surface.add_probe(probe, move_list)
        say(result.to_str)
      end

      def should_continue_or_quit
        loop do
          response = ask('Do you want to add another probe (y/n)?')
          break unless response.chars.first.casecmp('y') == 0

          type_probe_informations
        end
      end

      def create_probe(x, y, direction)
        coordinate = Hayden::Probe::Core::Coordinate.new(x.to_i, y.to_i)
        probe = Hayden::Probe::Core::Probe.new(coordinate, direction.downcase.to_sym)
        probe
      end
    end
  end
end