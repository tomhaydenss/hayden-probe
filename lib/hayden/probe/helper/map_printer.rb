module Hayden
  module Probe
    module Helper
      module MapPrinter
        def print_map
          x_max = dimensions.x
          y_max = dimensions.y
          horizontal_border = ''.ljust(x_max + 1, '─')
          puts "┌#{horizontal_border}┐"
          y_max.downto(0) do |y|
            print '│'
            (0..x_max).each do |x|
              probe = @positions["#{x} #{y}"]&.direction
              print probe.nil? ? ' ' : probe
            end
            puts '│'
          end
          puts "└#{horizontal_border}┘"
        end
      end
    end
  end
end
