# frozen_string_literal: true

require "test_helper"

class TestSudokuTools < Minitest::Test
  def setup
    @matrix = [[1, 2, 3, 4, 5, 6, 7, 8, 9],
               [4, 5, 6, 7, 8, 9, 1, 2, 3],
               [7, 8, 9, 1, 2, 3, 4, 5, 6],
               [2, 3, 4, 5, 6, 7, 8, 9, 1],
               [5, 6, 7, 8, 9, 1, 2, 3, 4],
               [8, 9, 1, 2, 3, 4, 5, 6, 7],
               [3, 4, 5, 6, 7, 8, 9, 1, 2],
               [6, 7, 8, 9, 1, 2, 3, 4, 5],
               [9, 1, 2, 3, 4, 5, 6, 7, 8]]
  end

  def test_that_it_has_a_version_number
    refute_nil SudokuTools::VERSION
  end

  def test_cli_validate_exists
    assert_respond_to SudokuTools::CLI.new, :validate
  end

  def test_cli_print_exists
    assert_respond_to SudokuTools::CLI.new, :print
  end

  def test_read_matrix_valid
    assert_equal @matrix, SudokuTools.read_matrix("test/fixtures/matrix.valid")
  end

  def test_read_matrix_bad
    assert_raises(RuntimeError) { SudokuTools.read_matrix("test/fixtures/foo") }
  end
end
