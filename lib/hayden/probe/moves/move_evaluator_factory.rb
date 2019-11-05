module Hayden
  module Probe
    module Moves
      class MoveEvaluatorFactory
        TURN_MOVES = %i[l r].freeze
        FORWARD_MOVE = :m

        def self.for(surface, probe, move)
          if move == FORWARD_MOVE
            Hayden::Probe::Moves::ForwardMoveEvaluator.new(surface, probe)
          elsif TURN_MOVES.include? move
            Hayden::Probe::Moves::TurnMoveEvaluator.new(probe, move)
          else
            raise Hayden::Probe::Errors::InvalidInputData, 'Invalid move'
          end
        end
      end
    end
  end
end
