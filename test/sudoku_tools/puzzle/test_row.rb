# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Puzzle
    class TestRow < Minitest::Test
      def setup
        @cells = (1..9).map { |n| Cell.new(row: 1, column: n) }
        @row = Row.new(*@cells)
      end

      def test_row_exists
        assert_instance_of SudokuTools::Puzzle::Row, @row
      end

      def test_row_number
        assert_equal 1, @row.number
      end

      def test_row_raises_when_not_same
        @cells.last.row = 2

        assert_raises(ArgumentError) { Row.new(*@cells) }
      end

      def test_row_raises_when_not_complete
        assert_raises(ArgumentError) { Row.new(Cell.new(row: 1, column: 1), Cell.new(row: 1, column: 2)) }
      end

      def test_row_not_valid
        refute_predicate @row, :valid?
      end

      def test_row_valid
        cells = (1..9).map { |n| Cell.new(row: 1, column: n, solution: n) }
        row = Row.new(*cells)

        assert_predicate row, :valid?
      end
    end
  end
end
