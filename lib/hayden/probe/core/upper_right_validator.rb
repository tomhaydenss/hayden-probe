module Hayden
  module Probe
    module Core
      module UpperRightValidator

        MINIMUM_SURFACE_SIZE = 3

        # this rule was not specified, so it's an assumption
        def validate_upper_right_coordinate(coordinate)
          result = valid? coordinate
          raise Hayden::Probe::Core::InvalidInputData, 'Invalid information for upper right coordinate.' unless result
          result
        end

        private

        def valid?(coordinate)
          coordinate.x >= MINIMUM_SURFACE_SIZE && coordinate.y >= MINIMUM_SURFACE_SIZE
        end

      end
    end
  end
end
