module Hayden
  module Probe
    class Position
      def initialize(axis_x = 0, axis_y = 0)
        @axis_x = axis_x
        @axis_y = axis_y
      end

      def x
        @axis_x
      end

      def y
        @axis_y
      end

      def next(direction)
        case direction
        when :n
          @axis_y += 1
        when :s
          @axis_y -= 1
        when :e
          @axis_x += 1
        when :w
          @axis_x -= 1
        end
      end

      def to_s
        "#{x} #{y}"
      end
    end
  end
end
