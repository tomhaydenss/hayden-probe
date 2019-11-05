require 'hayden/probe/rules/upper_right_validator'
require 'hayden/probe/rules/position_validator'
require 'hayden/probe/rules/landing_validator'
require 'hayden/probe/helper/map_printer'

module Hayden
  module Probe
    class Surface
      include Hayden::Probe::Rules::UpperRightValidator
      include Hayden::Probe::Rules::PositionValidator
      include Hayden::Probe::Rules::LandingValidator
      include Hayden::Probe::Helper::MapPrinter

      def initialize(upper_right_coordinate)
        raise Hayden::Probe::Errors::BusinessError, 'Invalid upper/right coordinate' unless valid_coordinate?(upper_right_coordinate)

        @upper_right_coordinate = upper_right_coordinate
        @positions = {}
      end

      def dimensions
        @upper_right_coordinate
      end

      def land(probe)
        raise Hayden::Probe::Errors::BusinessError, 'Position is invalid to land a probe' unless valid_landing?(probe)

        @positions[probe.position.to_s] = probe
      end

      def update(probe)
        land(probe)
        take_off(probe)
      end

      private

      def valid_landing?(probe)
        valid_position?(probe.position, dimensions) && probe_can_land?(probe)
      end

      def take_off(probe)
        previous_position_key = @positions.select { |_, item| item.id == probe.id }.map{ |key, _| key }.first
        @positions.delete(previous_position_key)
      end
    end
  end
end
