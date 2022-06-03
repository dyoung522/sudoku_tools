# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Commands
    class TestValidate < Minitest::Test
      def setup
        @pastel = Pastel.new
        @matrix = SudokuTools.read_matrix("test/fixtures/matrix.valid")
        @matrix_invalid = SudokuTools.read_matrix("test/fixtures/matrix.invalid")
      end

      def test_grid_read_valid
        assert_output("This puzzle is valid\n") { Validate.run(matrix: @matrix, color: false) }
      end

      def test_grid_read_invalid
        assert_output("This puzzle is invalid\n-> Row 9 is invalid\n-> Column 9 is invalid\n-> Box 9 is invalid\n") do
          Validate.run(matrix: @matrix_invalid, color: false)
        end
      end

      def test_grid_read_bad
        assert_raises(ArgumentError) { Validate.run(matrix: []) }
      end
    end
  end
end
