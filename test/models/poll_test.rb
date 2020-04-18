require 'test_helper'

class PollTest < ActiveSupport::TestCase
  test "creating a poll generates a token" do
    poll = Poll.create!(valid_poll_params)

    assert_equal "Wtf?", poll.question
    assert_equal "Dunno, something, whatever", poll.answers
    assert_equal SecureRandom.hex.length, poll.token.length
  end

  test "creating a poll strips spaces from answers" do
    poll = Poll.create!(valid_poll_params.merge(answers: "something   ,    else"))

    assert_equal ["something", "else"].sort, poll.answer_list.sort
  end

  test "creating a poll with an escaped comma works" do
    poll = Poll.create!(valid_poll_params.merge(answers: "something\,something else    "))

    assert_equal ["something", "something else"].sort, poll.answer_list.sort
  end

  test "answer_list correctly parses the answers" do
    poll = polls(:colors)

    assert_equal ["red", "blue", "green"].sort, poll.answer_list.sort
  end

  private

  def valid_poll_params
    { question: "Wtf?", answers: "Dunno, something, whatever" }
  end
end
