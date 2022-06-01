# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Puzzle
    class TestCell < Minitest::Test
      def setup
        @cell = Cell.new(row: 1, column: 2)
      end

      def test_cell_exists
        assert_instance_of SudokuTools::Puzzle::Cell, @cell
      end

      def test_cell_row
        assert_equal 1, @cell.row
      end

      def test_cell_column
        assert_equal 2, @cell.column
      end

      def test_cell_box
        assert_equal [1, 1], Cell.new(row: 2, column: 2).box
        assert_equal [2, 2], Cell.new(row: 5, column: 5).box
        assert_equal [3, 3], Cell.new(row: 8, column: 8).box
      end

      def test_cell_add_single_possibility
        @cell.add 5
        assert_equal [5], @cell.posibilities
      end

      def test_cell_add_mulitple_possibilities
        @cell.add 1, 2, 9, 2
        assert_equal [1, 2, 9], @cell.posibilities
      end

      def test_cell_remove_single_possibility
        @cell.remove 5
        assert_equal [], @cell.posibilities
      end

      def test_cell_remove_mulitple_possibilities
        @cell.add 1, 2, 9, 2
        @cell.remove 1, 9, 9
        assert_equal [2], @cell.posibilities
      end

      def test_cell_solution_default
        assert_equal 0, @cell.solution
      end

      def test_cell_solution_valid
        @cell.solution = 9
        assert_equal 9, @cell.solution
      end

      def test_cell_solution_zero
        @cell.solution = 0
        assert_equal 0, @cell.solution
      end

      def test_cell_solution_raises_on_non_numeric
        assert_raises(ArgumentError) { @cell.solution = "foo" }
      end

      def test_cell_solution_raises_outside_range
        assert_raises(ArgumentError) { @cell.solution = -1 }
        assert_raises(ArgumentError) { @cell.solution = 10 }
      end
    end
  end
end
