module Hayden
  module Probe
    module Moves
      class TurnMoveEvaluator
        def initialize(probe, move)
          @probe = probe
          @move = move
        end

        def eval
          @probe.update(direction: @new_direction) if valid?
          false
        end

        private

        def valid?
          @new_direction = Hayden::Probe::Direction.new(@probe.direction.current).next(@move)
          !@new_direction.nil?
        end
      end
    end
  end
end
