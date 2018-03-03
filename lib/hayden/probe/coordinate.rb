module Hayden
  module Probe
    class Coordinate
      attr_reader :x, :y

      def initialize(x = 0, y = 0)
        @x = x
        @y = y
      end
    end
  end
end

