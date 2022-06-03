# frozen_string_literal: true

module SudokuTools
  module Commands
    class Validate
      attr_reader :grid

      def self.run(options)
        new(options).output
      end

      def initialize(options)
        @input_file = options.fetch(:file)

        raise "Unable to read from #{@input_file}" unless File.exist? @input_file

        @grid = read_matrix
      end

      def read_matrix
        matrix = []

        File.read(@input_file).split.each do |line|
          matrix << line.chars.map(&:to_i) if line =~ /\d{9}/
          matrix << line.split(",").map(&:to_i) if line =~ /\d\s*,\s*\d/
        end

        SudokuTools::Puzzle::Grid.new(matrix)
      end

      def output
        puts "This puzzle is #{grid.valid? ? 'valid' : 'invalid'}"
        grid.errors.each { |e| puts "* #{e}" }
      end
    end
  end
end
