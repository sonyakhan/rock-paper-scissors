require 'minitest/autorun'

class TestRPS < Minitest::Test
  def setup
    @rps = RPS.new
  end

  def test_that_rock_beats_scissors
    assert_equal 'Rock against Scissors! You Win!', @rps.play('rock')
  end
end