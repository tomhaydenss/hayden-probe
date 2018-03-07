module Hayden
  module Probe
    module Core
      module MoveListValidator

        ALLOWED_MOVES = %i[l r m].freeze

        def validate_move_list(move_list)
          result = move_list.uniq.reject { |move| ALLOWED_MOVES.include? move }.empty? && !move_list.to_a.empty?
          raise Hayden::Probe::Core::InvalidInputData, 'Invalid information for move list.' unless result
          result
        end

      end
    end
  end
end
