require 'hayden/probe/rules/position_validator'

module Hayden
  module Probe
    module Moves
      class ForwardMoveEvaluator
        include Hayden::Probe::Rules::PositionValidator

        def initialize(surface, probe)
          @surface = surface
          @probe = probe
        end

        def eval
          raise Hayden::Probe::Errors::BusinessError, 'Unable to perform this move' unless valid?

          @probe.update(x_axis: @new_position.x, y_axis: @new_position.y)
          true
        end

        private

        def valid?
          @new_position = Hayden::Probe::Position.new(@probe.position.x, @probe.position.y)
          @new_position.next(@probe.direction.current)
          valid_position?(@new_position, @surface.dimensions) && @surface.position_available?(@new_position)
        end
      end
    end
  end
end








