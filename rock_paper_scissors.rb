require 'minitest/autorun'
require 'pry'

class RPS
  attr_reader :cpu
  attr_reader :score
  attr_reader :wins

  def initialize
    @cpu = CPU.new
    @score = 0
    @wins = 0
  end

  def play(move)
    if answer_sheet[move.downcase.to_sym] == @cpu.move
      verdict = 'Win'
      # add_to_score
      adjust_score(verdict)
    else
      verdict = 'Lose'
      adjust_score(verdict)
    end
    message = "#{move.downcase.capitalize} against #{@cpu.move.capitalize}! You #{verdict}!"
    message
  end

  def adjust_score(verdict)
    if verdict == 'Win'
      @score += 1
      if @score >= 3
        @wins += 1
        @score = 0
      end
    else
      @score = 0
    end
  end

  private

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

  def win_round
    user_move = 'rock'
    @rps.cpu.move = :scissors
    @rps.play(user_move)
  end

  def lose_round
    user_move = 'rock'
    @rps.cpu.move = :paper
    @rps.play(user_move)
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
    describe 'win' do
      it 'increments score by 1 upon winning' do
        win_round
        assert_equal 1, @rps.score
      end

      it 'resets score to 0 after 3 wins' do
        4.times { win_round }
        assert_equal 1, @rps.score
      end
    end

    describe 'lose' do
      it 'resets score to 0 after a loss' do
        win_round
        lose_round
        assert_equal 0, @rps.score
      end
    end
  end

  describe '#wins' do
    it 'returns number of 3 consecutive wins' do
      3.times { win_round }
      assert_equal 1, @rps.wins
    end
  end

  describe '#losses' do
    it 'returns number of 3 consecutive losses' do
      3.times { lose_round }
      assert_equal 1, @rps.losses
    end
  end
end