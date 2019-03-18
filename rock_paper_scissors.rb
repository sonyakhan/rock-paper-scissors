require 'minitest/autorun'

class TestRPS < Minitest::Test
  def setup
    @rps = RPS.new
  end

  def test_that_rock_beats_scissors
    @rps.expect(:play, "Rock against Scissors! You Win!", ['rock'])
    @rps.play('rock')
  end
end