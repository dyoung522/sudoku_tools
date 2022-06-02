# frozen_string_literal: true

module SudokuTools
  module Puzzle
    class Cell
      attr_reader :posibilities

      def initialize(row:, column:, solution: 0)
        @position = [row, column] # The position in the grid: [row, column]
        @posibilities = [] # An array of possible solutions
        @solution = solution # the solution for this cell or 0
      end

      # Returns an integer representing the box number (1-9)
      def box
        col = (column - 1) / 3

        return col + 1 if row <= 3
        return col + 4 if row <= 6

        col + 7
      end

      # Returns an integer representing the column (1-9)
      def column
        @position[1]
      end

      def column=(number)
        raise ArgumentError, "Invalid column number" unless number >= 1 && number <= 9

        @position[1] = number
      end

      # Returns an integer representing the row (1-9)
      def row
        @position[0]
      end

      def row=(number)
        raise ArgumentError, "Invalid row number" unless number >= 1 && number <= 9

        @position[0] = number
      end

      def add(*numbers)
        numbers.each { |n| @posibilities.push(n) unless @posibilities.include?(n) }
      end

      def remove(*numbers)
        numbers.each { |n| @posibilities.delete(n) if @posibilities.include?(n) }
      end

      def solution
        @solution || 0
      end

      def solution=(number)
        raise ArgumentError, "solution must be numeric" unless number.is_a?(Numeric)

        # solution can be zero, meaning it's unsolved.
        raise ArgumentError, "solution must be within the range of 0-9" unless number >= 0 && number <= 9

        @solution = number
      end
    end
  end
end
