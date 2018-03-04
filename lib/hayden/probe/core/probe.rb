module Hayden
  module Probe
    module Core
      class Probe

        ALLOWED_DIRECTIONS = %w[N S E W].freeze

        attr_accessor :coordinate, :direction

        def initialize(coordinate, direction)
          raise ArgumentError.new('Invalid information for direction.') unless ALLOWED_DIRECTIONS.include? direction

          @coordinate = coordinate
          @direction = direction
        end

      end
    end
  end
end