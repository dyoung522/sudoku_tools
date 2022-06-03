# frozen_string_literal: true

require_relative "cell"

module SudokuTools
  module Puzzle
    class Grid
      attr_reader :errors, :matrix, :puzzle

      def initialize(matrix)
        @matrix = matrix
        @puzzle = []
        @errors = []

        raise ArgumentError, "Input MATRIX does not conform to 9x9 grid standard" unless validate_matrix_format

        build_puzzle
      end

      def row(row)
        @puzzle.select { |c| c.row == row }
      end

      def column(column)
        @puzzle.select { |c| c.column == column }
      end

      def box(box)
        @puzzle.select { |c| c.box == box }
      end

      def valid?
        result = true

        (1..9).each do |num|
          result = false unless validate_row(num)
          result = false unless validate_column(num)
          result = false unless validate_box(num)
        end

        result
      end

      private

      def valid_map
        @valid_map ||= [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end

      def valid_sum
        @valid_sum ||= valid_map.sum
      end

      def validate(obj)
        (obj.sum(&:solution) == valid_sum) && (obj.map(&:solution).sort == valid_map)
      end

      def validate_box(num)
        return true if validate(box(num))

        @errors << "Box #{num} is invalid"
        false
      end

      def validate_row(num)
        return true if validate(row(num))

        @errors << "Row #{num} is invalid"
        false
      end

      def validate_column(num)
        return true if validate(column(num))

        @errors << "Column #{num} is invalid"
        false
      end

      def build_puzzle
        @puzzle = []
        @matrix.each_with_index do |row, row_number|
          row.each_with_index do |cell, column_number|
            @puzzle << Cell.new(row: row_number + 1, column: column_number + 1, solution: cell)
          end
        end
      end

      def validate_matrix_format
        @matrix.is_a?(Array) && @matrix.count == 9 && @matrix.map(&:count).sum == 81
      end
    end
  end
end
