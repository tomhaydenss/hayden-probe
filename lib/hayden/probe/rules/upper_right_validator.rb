module Hayden
  module Probe
    module Rules
      module UpperRightValidator
        WIDTH_LIMITS = (3..100).freeze
        HEIGHT_LIMITS = (3..25).freeze

        protected

        # ASSUMPTION: this rule was not specified
        def valid_coordinate?(coordinate)
          WIDTH_LIMITS.include?(coordinate.x) && HEIGHT_LIMITS.include?(coordinate.y)
        end
      end
    end
  end
end
