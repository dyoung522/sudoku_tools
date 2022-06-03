# frozen_string_literal: true

require "pastel"

module SudokuTools
  module Commands
    class Validate
      attr_reader :grid

      def self.run(opts)
        new(opts).output
      end

      def initialize(opts)
        @colorize = opts.fetch(:color, true)

        @grid = SudokuTools::Puzzle::Grid.new(opts.fetch(:matrix))
      end

      def color
        @color ||= Pastel.new
      end

      def output
        return output_valid("This puzzle is valid") if grid.valid?

        output_invalid("This puzzle is invalid")
      end

      def output_valid(text)
        puts @colorize ? color.green.bold(text) : text
      end

      def output_invalid(text)
        puts @colorize ? color.red.bold(text) : text
        grid.errors.each { |e| puts @colorize ? color.yellow.bold("-> ") + e : "-> #{e}" }
      end
    end
  end
end
