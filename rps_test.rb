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
  def test_rock_beats_scissors
    rules = Rules.new
    expected = :win
    actual = rules.beats?(:rock, :scissors)
    assert_equal expected, actual
  end

  def test_paper_beats_rock
    rules = Rules.new
    expected = :win
    actual = rules.beats?(:paper, :rock)
    assert_equal expected, actual
  end

  def test_scissors_beats_paper
    rules = Rules.new
    expected = :win
    actual = rules.beats?(:scissors, :paper)
    assert_equal expected, actual
  end

  def test_rock_loses_to_rock
    rules = Rules.new
    expected = :lose
    actual = rules.beats?(:rock, :rock)
    assert_equal expected, actual
  end

  def test_rock_loses_to_paper
    rules = Rules.new
    expected = :lose
    actual = rules.beats?(:rock, :paper)
    assert_equal expected, actual
  end

end
