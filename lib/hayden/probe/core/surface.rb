require 'hayden/probe/core/move_evaluator'
require 'hayden/probe/core/move_list_validator'
require 'hayden/probe/core/upper_right_validator'

module Hayden
  module Probe
    module Core
      class Surface
        include Hayden::Probe::Core::MoveEvaluator
        include Hayden::Probe::Core::MoveListValidator
        include Hayden::Probe::Core::UpperRightValidator

        attr_accessor :upper_right_coordinate

        def initialize(upper_right_coordinate)
          validate_upper_right_coordinate(upper_right_coordinate)

          @upper_right_coordinate = upper_right_coordinate
        end

        def add_probe(probe, move_list)
          validate_move_list(move_list)
          perform_prove_movement(probe, move_list)
        end

        private

        def perform_prove_movement(probe, move_list)
          current_probe = probe
          move_list.each { |move| current_probe = validate_turn(eval(current_probe, move)) }
          current_probe
        end

        def validate_turn(probe)
          if valid_position?(probe, upper_right_coordinate)
            raise Hayden::Probe::Core::BusinessError, 'It will result in an invalid position.'
          end
          probe
        end

        def valid_position?(probe, upper_right_coordinate)
          negative_coordinate?(probe) || overflow_surface_limit?(probe, upper_right_coordinate)
        end

        def negative_coordinate?(probe)
          probe.coordinate.x < 0 || probe.coordinate.y < 0
        end

        def overflow_surface_limit?(probe, upper_right_coordinate)
          probe.coordinate.x > upper_right_coordinate.x || probe.coordinate.y > upper_right_coordinate.y
        end

      end
    end
  end
end