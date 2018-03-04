module Hayden
  module Probe
    module Core
      class Coordinate
        attr_accessor :x, :y

        def initialize(x = 0, y = 0)
          @x = x
          @y = y
        end
      end
    end
  end
end

