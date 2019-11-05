require 'securerandom'

module Hayden
  module Probe
    class Probe
      attr_accessor :id, :position, :direction

      def initialize(x_axis = 0, y_axis = 0, direction = :n)
        @id = SecureRandom.alphanumeric
        @position = Hayden::Probe::Position.new(x_axis, y_axis)
        @direction = Hayden::Probe::Direction.new(direction)
      end

      def update(params)
        @position = Hayden::Probe::Position.new(params[:x_axis], params[:y_axis]) unless params[:x_axis].nil? && params[:y_axis].nil?
        @direction = Hayden::Probe::Direction.new(params[:direction]) unless params[:direction].nil?
        self
      end

      def to_s
        "#{position.to_s} #{direction.to_s}"
      end
    end
  end
end
