require 'hayden/probe/core/move_evaluator'

module Hayden
  module Probe
    module Core
      class Surface
        include Hayden::Probe::Core::MoveEvaluator

        MINIMUM_MATRIX_SIZE = 3
        EMPTY_VALUE = 0
        ALLOWED_MOVES = %i[l r m].freeze

        attr_accessor :upper_right_coordinate
        attr_reader :matrix

        def initialize(upper_right_coordinate)
          validate_coordinate(upper_right_coordinate)

          @upper_right_coordinate = upper_right_coordinate
          @matrix = Array.new(upper_right_coordinate.y) { Array.new(upper_right_coordinate.x, EMPTY_VALUE) }
        end

        def add_probe(probe, move_list)
          validate_move_list(move_list)
          perform_prove_movement(probe, move_list)
        end

        private

        # this rule was not specified, so it's an assumption
        def validate_coordinate(coordinate)
          raise Hayden::Probe::Core::InvalidInputData.new('Invalid information for upper right coordinate.') unless coordinate_valid? coordinate
        end

        def coordinate_valid?(coordinate)
          coordinate.x >= MINIMUM_MATRIX_SIZE && coordinate.y >= MINIMUM_MATRIX_SIZE
        end

        def validate_move_list(move_list)
          result = move_list.uniq.reject { |move| ALLOWED_MOVES.include? move }
          raise Hayden::Probe::Core::InvalidInputData.new('Invalid information for move list.') unless result.empty?
        end

        def perform_prove_movement(probe, move_list)
          current_probe = probe
          move_list.each { |move| current_probe = validate_turn(eval(current_probe, move)) }
          current_probe
        end

        def validate_turn(probe)
          if probe.coordinate.x < 0 || probe.coordinate.y < 0 || probe.coordinate.x > upper_right_coordinate.x || probe.coordinate.y > upper_right_coordinate.y
            raise Hayden::Probe::Core::BusinessError.new('It will result in an invalid position.')
          end
          probe
        end

      end
    end
  end
end