# frozen_string_literal: true

require "test_helper"

module SudokuTools
  module Commands
    class TestValidate < Minitest::Test
      def test_grid_read_valid
        assert_output("This puzzle is valid\n") { Validate.run(file: "test/fixtures/matrix.valid") }
      end

      def test_grid_read_invalid
        assert_output("This puzzle is invalid\n* Row 9 is invalid\n* Column 9 is invalid\n* Box 9 is invalid\n") do
          Validate.run(file: "test/fixtures/matrix.invalid")
        end
      end

      def test_grid_read_bad
        assert_raises(ArgumentError) { Validate.run(file: "test/fixtures/matrix.bad") }
      end
    end
  end
end
