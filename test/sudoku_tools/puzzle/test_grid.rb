# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Puzzle
    class TestGrid < Minitest::Test
      VALID_MATRIX = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9],
        [4, 5, 6, 7, 8, 9, 1, 2, 3],
        [7, 8, 9, 1, 2, 3, 4, 5, 6],
        [2, 3, 4, 5, 6, 7, 8, 9, 1],
        [5, 6, 7, 8, 9, 1, 2, 3, 4],
        [8, 9, 1, 2, 3, 4, 5, 6, 7],
        [3, 4, 5, 6, 7, 8, 9, 1, 2],
        [6, 7, 8, 9, 1, 2, 3, 4, 5],
        [9, 1, 2, 3, 4, 5, 6, 7, 8]
      ].freeze

      INVALID_MATRIX = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9],
        [4, 5, 6, 7, 8, 9, 1, 2, 3],
        [7, 8, 9, 1, 2, 3, 4, 5, 6],
        [2, 3, 4, 5, 6, 7, 8, 9, 1],
        [5, 6, 7, 8, 9, 1, 2, 3, 4],
        [8, 9, 1, 2, 3, 4, 5, 6, 7],
        [3, 4, 5, 6, 7, 8, 9, 1, 2],
        [6, 7, 8, 9, 1, 2, 3, 4, 5],
        [1, 1, 2, 3, 4, 5, 6, 7, 8]
      ].freeze

      def setup
        @grid = Grid.new VALID_MATRIX
        @grid_invalid = Grid.new INVALID_MATRIX
      end

      def test_grid_invalid_matrix
        assert_raises(ArgumentError) { Grid.new [[0, 0, 0, 0, 0, 0, 0, 0, 0], [], [], [], [], [], [], [], []] }
      end

      def test_grid_valid
        assert_predicate(@grid, :valid?)
        assert_empty(@grid.errors)
      end

      def test_grid_not_valid
        refute_predicate(@grid_invalid, :valid?)
        assert_equal(["Column 1 is invalid", "Box 7 is invalid", "Row 9 is invalid"], @grid_invalid.errors)
      end

      def test_grid_row
        assert_equal VALID_MATRIX[0], @grid.row(1).map(&:solution)
        assert_equal VALID_MATRIX[4], @grid.row(5).map(&:solution)
        assert_equal VALID_MATRIX[8], @grid.row(9).map(&:solution)
      end

      def test_grid_column
        assert_equal VALID_MATRIX.map { |r| r[0] }, @grid.column(1).map(&:solution)
        assert_equal VALID_MATRIX.map { |r| r[4] }, @grid.column(5).map(&:solution)
        assert_equal VALID_MATRIX.map { |r| r[8] }, @grid.column(9).map(&:solution)
      end

      def test_grid_box
        assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @grid.box(1).map(&:solution)
        assert_equal [5, 6, 7, 8, 9, 1, 2, 3, 4], @grid.box(5).map(&:solution)
        assert_equal [9, 1, 2, 3, 4, 5, 6, 7, 8], @grid.box(9).map(&:solution)
      end

      def test_grid_read_valid
        assert_predicate(Grid.read("test/fixtures/matrix.valid"), :valid?)
      end

      def test_grid_read_invalid
        assert_raises(ArgumentError) { Grid.read("test/fixtures/matrix.invalid") }
      end
    end
  end
end
