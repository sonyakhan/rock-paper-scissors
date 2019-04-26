require "minitest/autorun"

class Rules
  def initialize
    @map = {
        :rock => :scissors,
        :paper => :rock,
        :scissors => :paper
    }
  end

  def beats?(move1, move2)
    if @map[move1] == move2
      :win
    else
      :lose
    end
  end
end

class RPSTest < Minitest::Test

  rules = Rules.new

  describe 'when winning hand is played' do
    expected = :win

    it 'returns win' do
      assert_equal(expected, rules.beats?(:rock, :scissors))
      assert_equal(expected, rules.beats?(:paper, :rock))
      assert_equal(expected, rules.beats?(:scissors, :paper))
    end
  end

  describe 'when losing hand is played' do
    expected = :lose

    it 'returns lose' do
      assert_equal(expected, rules.beats?(:rock, :rock))
      assert_equal(expected, rules.beats?(:rock, :paper))
    end
  end

end
