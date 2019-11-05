module Hayden
  module Probe
    module Errors
      class HaydenProbeError < StandardError
      end
      class InvalidInputData < HaydenProbeError
      end
      class BusinessError < HaydenProbeError
      end
    end
  end
end