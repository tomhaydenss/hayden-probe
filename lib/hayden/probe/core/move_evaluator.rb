module Hayden
  module Probe
    module Core
      module MoveEvaluator

        DIRECTION_MOVES = { n: { l: :w, r: :e },
                            s: { l: :e, r: :w },
                            e: { l: :n, r: :s },
                            w: { l: :s, r: :n } }.freeze
        TURN_MOVES = %i[l r].freeze
        FORWARD_MOVE = %i[m].freeze

        def eval(probe, move)
          probe = turn(probe, move) if TURN_MOVES.include? move
          probe = move(probe) if FORWARD_MOVE.include? move
          probe
        end

        private

        def turn(probe, move)
          probe.direction = next_direction(probe.direction, move)
          probe
        end

        def next_direction(current_direction, move)
          DIRECTION_MOVES[current_direction][move]
        end

        def move(probe)
          coordinate = Coordinate.new(probe.coordinate.x, probe.coordinate.y)
          case probe.direction
            when :n
              coordinate.y = coordinate.y + 1
            when :s
              coordinate.y = coordinate.y - 1
            when :e
              coordinate.x = coordinate.x + 1
            else
              coordinate.x = coordinate.x - 1
          end
          probe.coordinate = coordinate
          probe
        end
      end
    end
  end
end
