require 'minitest/autorun'

class RPS
  def play(move)
    @cpu = CPU.new
    if move == 'rock' && @cpu.move == 'scissors'
      'Rock against Scissors! You Win!'
    end
  end

end

class CPU
  attr_reader :move

  def initialize
    @move = 'scissors'
  end

  def play
    @move
  end
end

class TestRPS < Minitest::Test
  def setup
    @rps = RPS.new
  end

  def test_that_rock_beats_scissors
    assert_equal 'Rock against Scissors! You Win!', @rps.play('rock')
  end

  def test_that_paper_beats_rock
    assert_equal 'Paper against Rock! You Win!', @rps.play('paper')
  end
end