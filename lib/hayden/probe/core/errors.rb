module Hayden
  module Probe
    module Core
      class HaydenProbeError < StandardError
      end
      class InvalidInputData < HaydenProbeError
      end
      class BusinessError < HaydenProbeError
      end
    end
  end
end