require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  test "creating a poll" do
    assert_difference "Poll.count" do
      post "/polls", params: {
        poll: {
          question: "wtf?",
          answers: "wat, huh, why"
        }
      }
    end

    assert_response :created
    assert_equal SecureRandom.hex.length, parsed_response['token'].length
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

  def parsed_response
    JSON.parse(@response.body)
  end
end
