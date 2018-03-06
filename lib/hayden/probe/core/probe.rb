module Hayden
  module Probe
    module Core
      class Probe

        ALLOWED_DIRECTIONS = %i[n s e w].freeze

        attr_accessor :coordinate, :direction

        def initialize(coordinate, direction)
          raise Hayden::Probe::Core::InvalidInputData.new('Invalid information for direction.') unless ALLOWED_DIRECTIONS.include? direction

          @coordinate = coordinate
          @direction = direction
        end

      end
    end
  end
end