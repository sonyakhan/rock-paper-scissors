require 'minitest/autorun'
require 'pry'

class RPS
  attr_reader :cpu

  def initialize
    @cpu = CPU.new
  end

  def play(move)
    if answer_sheet[move.downcase.to_sym] == @cpu.move
      verdict = 'Win'
    else
      verdict = 'Lose'
    end
    message = "#{move.downcase.capitalize} against #{@cpu.move.capitalize}! You #{verdict}!"
    message
  end

  def answer_sheet
    {
        rock: :scissors,
        paper: :rock,
        scissors: :paper
    }
  end

end

class CPU
  attr_accessor :move

  def initialize
    @move = self.play
  end

  def play
    moves = [:rock, :paper, :scissors]
    @move = moves.sample
  end
end

describe RPS do

  before do
    @rps = RPS.new
  end

  describe '#play' do

    it 'plays rock' do
      @rps.cpu.move = :scissors
      assert_equal "Rock against #{@rps.cpu.move.capitalize}! You Win!", @rps.play('rock')
    end

    it 'plays paper' do
      @rps.cpu.move = :rock
      assert_equal "Paper against #{@rps.cpu.move.capitalize}! You Win!", @rps.play('paper')
    end
  end
end