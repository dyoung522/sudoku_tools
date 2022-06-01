# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Puzzle
    class TestColumn < Minitest::Test
      def setup
        @cells = (1..9).map { |n| Cell.new(row: n, column: 1) }
        @column = Column.new(*@cells)
      end

      def test_column_exists
        assert_instance_of SudokuTools::Puzzle::Column, @column
      end

      def test_column_number
        assert_equal 1, @column.number
      end

      def test_column_raises_when_not_same
        @cells.last.column = 2

        assert_raises(ArgumentError) { Column.new(*@cells) }
      end

      def test_column_raises_when_not_complete
        assert_raises(ArgumentError) { Column.new(Cell.new(row: 1, column: 1), Cell.new(row: 2, column: 1)) }
      end

      def test_column_not_valid
        refute_predicate @column, :valid?
      end

      def test_column_valid
        cells = (1..9).map { |n| Cell.new(row: n, column: 1, solution: n) }
        column = Column.new(*cells)

        assert_predicate column, :valid?
      end
    end
  end
end
