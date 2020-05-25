require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  test "creating a poll stores a poll" do
    assert_difference "Poll.count" do
      post "/polls", params: valid_poll_params
    end

    assert_response :created
    assert_equal SecureRandom.hex.length, parsed_response['token'].length
  end

  test "creating a poll stores poll_options" do
    assert_difference "PollOption.count", 3 do
      post "/polls", params: valid_poll_params
    end

    poll = Poll.find_by(token: parsed_response['token'])

    assert_equal 3, poll.poll_options.count
    assert_predicate poll.poll_options.where(label: 'wat'), :exists?
  end

  test "getting a poll" do
    poll = polls(:colors)

    get "/polls/#{poll.token}"

    assert_response 200
  end

  test "getting polls" do
    get "/polls"

    assert_response 200
    assert_operator parsed_response.length, :>=, 1
  end

  private

  def valid_poll_params
    {
      poll: {
        question: "wtf?",
        options: "wat, huh, why"
      }
    }
  end

  def parsed_response
    JSON.parse(@response.body)
  end
end
