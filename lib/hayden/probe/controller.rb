module Hayden
  module Probe
    class Controller
      def initialize(surface)
        @surface = surface
        @probes = {}
      end

      def add_probe(probe)
        @surface.land(probe)
        @probes[probe.id] = probe
      end

      def move_probe(probe, *moves)
        moves.each do |move|
          begin
            has_moved = Hayden::Probe::Moves::MoveEvaluatorFactory.for(@surface, probe, move).eval
            @surface.update(probe) if has_moved
          rescue Hayden::Probe::Errors::HaydenProbeError => e
            puts "Error: #{e.message}. Please review your input params."
          end
        end
        @surface.print_map
      end
    end
  end
end
