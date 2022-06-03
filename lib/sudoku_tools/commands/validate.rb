# frozen_string_literal: true

module SudokuTools
  module Commands
    class Validate
      attr_reader :grid

      def self.run(opts)
        new(opts).output
      end

      def initialize(opts)
        matrix = opts.fetch(:matrix)

        @grid = SudokuTools::Puzzle::Grid.new(matrix)
      end

      def output
        puts "This puzzle is #{grid.valid? ? 'valid' : 'invalid'}"
        grid.errors.each { |e| puts "* #{e}" }
      end
    end
  end
end
