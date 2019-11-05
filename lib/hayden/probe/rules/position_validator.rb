module Hayden
  module Probe
    module Rules
      module PositionValidator
        protected

        # ASSUMPTION: these rules were not specified
        def valid_position?(new_position, dimensions)
          !negative_coordinate?(new_position) && !overflow_surface_limit?(new_position, dimensions)
        end

        def negative_coordinate?(position)
          position.x.negative? || position.y.negative?
        end

        def overflow_surface_limit?(position, dimensions)
          position.x > dimensions.x || position.y > dimensions.y
        end
      end
    end
  end
end
