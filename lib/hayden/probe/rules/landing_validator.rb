module Hayden
  module Probe
    module Rules
      module LandingValidator
        def position_available?(position)
          @positions[position.to_s].nil?
        end

        protected

        # ASSUMPTION: these rules were not specified
        def probe_can_land?(probe)
          position_available?(probe.position) || probe_already_landed_at_position?(probe)
        end

        def probe_already_landed_at_position?(probe)
          @positions[probe.position.to_s].id == probe.id
        end
      end
    end
  end
end
