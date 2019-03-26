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
    describe 'win' do

      it 'plays rock' do
        user_move = 'rock'
        @rps.cpu.move = :scissors
        assert_equal "Rock against #{@rps.cpu.move.capitalize}! You Win!", @rps.play(user_move)
      end

      it 'plays paper' do
        user_move = 'paper'
        @rps.cpu.move = :rock
        assert_equal "Paper against #{@rps.cpu.move.capitalize}! You Win!", @rps.play(user_move)
      end

      it 'plays scissors' do
        user_move = 'scissors'
        @rps.cpu.move = :paper
        assert_equal "Scissors against #{@rps.cpu.move.capitalize}! You Win!", @rps.play(user_move)
      end
    end

    describe 'lose' do

      describe 'CPU wins' do
        it 'plays rock' do
          user_move = 'rock'
          @rps.cpu.move = :paper
          assert_equal "Rock against #{@rps.cpu.move.capitalize}! You Lose!", @rps.play(user_move)
        end

        it 'plays paper' do
          user_move = 'paper'
          @rps.cpu.move = :scissors
          assert_equal "Paper against #{@rps.cpu.move.capitalize}! You Lose!", @rps.play(user_move)
        end

        it 'plays scissors' do
          user_move = 'scissors'
          @rps.cpu.move = :rock
          assert_equal "Scissors against #{@rps.cpu.move.capitalize}! You Lose!", @rps.play(user_move)
        end
      end

      describe 'draw' do
        it 'plays rock' do
          user_move = 'rock'
          @rps.cpu.move = :rock
          assert_equal "Rock against #{@rps.cpu.move.capitalize}! You Lose!", @rps.play(user_move)
        end

        it 'plays paper' do
          user_move = 'paper'
          @rps.cpu.move = :paper
          assert_equal "Paper against #{@rps.cpu.move.capitalize}! You Lose!", @rps.play(user_move)
        end

        it 'plays scissors' do
          user_move = 'scissors'
          @rps.cpu.move = :scissors
          assert_equal "Scissors against #{@rps.cpu.move.capitalize}! You Lose!", @rps.play(user_move)
        end
      end
    end
  end

  describe '#score' do
    it 'returns a number between 0 and 3' do
      assert_includes 0..3, @rps.score
    end
  end
end