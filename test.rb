require "minitest/autorun"
require "./wordplay"

class TestWordplay < Minitest::Test
  def test_sentences
    assert_equal(["a", "b", "c d", "e f g"], "a. b. c d. e f g.".sentences)
    test_text = %q{Hello. This is a test
      of sentence separation. This is the end of the test.}
    assert_equal("This is the end of the test", test_text.sentences[2])
    assert_equal(["Hello There","How Are You","I am fine"],"Hello There! How Are You? I am fine..".sentences)
  end
  def test_words
    assert_equal(%w{Hello what's up},"Hello!!! what's up".words)
  end
  def test_best_sentence
    assert_equal('This is a great test',
    Wordplay.best_sentence(['This is a test',
      'This is another test',
      'This is a great test'],
      %w{test great this}))
    assert_equal('This is a great test',
    Wordplay.best_sentence(['This is a great test'],
      %w{still the best}))
  end
  def test_basic_pronouns
    assert_equal("i am a robot", Wordplay.switch_pronouns("you are a robot"))
    assert_equal("you are a person", Wordplay.switch_pronouns("i am a person"))
    assert_equal("i love you", Wordplay.switch_pronouns("you love me"))
  end
  def test_mixed_pronouns
    assert_equal("you gave me life", Wordplay.switch_pronouns("i gave you life"))
    assert_equal("i am not what you are", Wordplay.switch_pronouns("you are not what i am"))
    assert_equal("i annoy your dog", Wordplay.switch_pronouns("you annoy my dog"))
  end
end
