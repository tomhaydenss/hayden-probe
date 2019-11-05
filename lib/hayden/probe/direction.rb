module Hayden
  module Probe
    class Direction
      ALLOWED_DIRECTIONS = {
        n: { l: :w, r: :e },
        s: { l: :e, r: :w },
        e: { l: :n, r: :s },
        w: { l: :s, r: :n }
      }.freeze
      private_constant :ALLOWED_DIRECTIONS

      attr_reader :current

      def initialize(direction = :n)
        raise Hayden::Probe::Errors::InvalidInputData, 'Invalid direction' unless valid_direction? direction

        @current = direction
      end

      def next(move)
        raise Hayden::Probe::Errors::InvalidInputData, 'Invalid move' unless valid_move? move

        @current = ALLOWED_DIRECTIONS[@current][move]
      end

      def to_s
        @current.to_s.upcase
      end

      private

      def valid_direction?(direction)
        ALLOWED_DIRECTIONS.include? direction
      end

      def valid_move?(move)
        ALLOWED_DIRECTIONS[@current].include? move
      end
    end
  end
end
