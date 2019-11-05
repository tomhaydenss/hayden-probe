module Hayden
  module Probe
    class Position
      attr_writer :x_axis, :y_axis

      def initialize(x_axis = 0, y_axis = 0)
        @x_axis = x_axis
        @y_axis = y_axis
      end

      def x
        @x_axis
      end

      def y
        @y_axis
      end

      def next(direction)
        case direction
        when :n
          @y_axis += 1
        when :s
          @y_axis -= 1
        when :e
          @x_axis += 1
        when :w
          @x_axis -= 1
        end
      end

      def to_s
        "#{x} #{y}"
      end
    end
  end
end
