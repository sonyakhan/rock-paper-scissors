require 'minitest/autorun'

class RPS
  def play(move)
    if move == 'rock'
      'Rock against Scissors! You Win!'
    end
  end

end

class TestRPS < Minitest::Test
  def setup
    @rps = RPS.new
  end

  def test_that_rock_beats_scissors
    assert_equal 'Rock against Scissors! You Win!', @rps.play('rock')
  end
end