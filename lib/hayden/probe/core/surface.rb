module Hayden
  module Probe
    module Core
      class Surface

        MINIMUM_MATRIX_SIZE = 3
        EMPTY_VALUE = 0

        attr_accessor :upper_right_coordinate
        attr_reader :matrix

        def initialize(upper_right_coordinate)
          validate_coordinate(upper_right_coordinate)

          @upper_right_coordinate = upper_right_coordinate
          @matrix = Array.new(upper_right_coordinate.y) { Array.new(upper_right_coordinate.x, EMPTY_VALUE) }
        end

        private

        # this rule was not specified, so it's an assumption
        def validate_coordinate(coordinate)
          raise ArgumentError.new('Invalid information for upper right coordinate.') unless coordinate_valid? coordinate
        end

        def coordinate_valid?(coordinate)
          coordinate.x >= MINIMUM_MATRIX_SIZE && coordinate.y >= MINIMUM_MATRIX_SIZE
        end

      end
    end
  end
end