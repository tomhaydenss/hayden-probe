require 'thor'
require 'hayden/probe'

module Hayden
  module Probe
    class CLI < Thor
      desc 'surface_exploration', 'Allow surface exploration with probes'
      def surface_exploration
        loop do
          begin
            type_surface_informations
            type_probe_informations
          rescue Hayden::Probe::Errors::HaydenProbeError => e
            say("Error: #{e.message}. Please review your input params.")
          end
          break unless should_continue_with_surface
        end
      rescue StandardError => e
        say("Unexpected error: #{e.message}")
      end

      private

      def type_surface_informations
        say('Please, inform the surface\'s dimensions, represented by upper-right coordinate')
        x = ask('Coordinate X (minimum 3 and maximum 100):')
        y = ask('Coordinate Y (minimum 3 and maximum 25):')
        @controller = Hayden::Probe::Controller.new(create_surface(x, y))
      end

      def should_continue_with_surface
        response = ask('Do you want to explore another surface (y/n)?')
        response.chars.first.casecmp('y').zero?
      end

      def create_surface(x, y)
        upper_right_coordinate = Hayden::Probe::Position.new(x.to_i, y.to_i)
        Hayden::Probe::Surface.new(upper_right_coordinate)
      end

      def type_probe_informations
        loop do
          begin
            say('Please, inform the probe\'s positions and direction')
            x = ask('Coordinate X:')
            y = ask('Coordinate Y:')
            direction = ask('Direction (N/S/E/W):')
            probe = create_probe(x, y, direction)
            @controller.add_probe(probe)

            say('Please, inform the sequence of movements that the probe should do')
            say('  Ex: If you wish the probe to turn Left, Move forward, turn Left again, Move forward twice')
            say('      You should type the following sequence: LMLMM')
            say('Movements alloweds are M = Move forward, L = Turn Left and R = Turn Right')
            moves = ask('Movements sequence:').downcase.chars.map(&:to_sym)
            @controller.move_probe(probe, *moves)
            say("Result: #{probe.to_s}")
          rescue Hayden::Probe::Errors::HaydenProbeError => e
            say("Error: #{e.message}. Please review your input params.")
          end
          break unless should_continue_with_probe
        end
      end

      def should_continue_with_probe
        response = ask('Do you want to add another probe (y/n)?')
        response.chars.first.casecmp('y').zero?
      end

      def create_probe(x, y, direction)
        Hayden::Probe::Probe.new(x.to_i, y.to_i, direction.downcase.to_sym)
      end
    end
  end
end
