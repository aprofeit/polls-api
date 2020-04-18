require 'test_helper'

class PollResponsesControllerTest < ActionDispatch::IntegrationTest
  test "creating a response" do
    assert_difference "PollResponse.count" do
      poll = polls(:colors)

      post "/polls/abc123/poll_responses", params: { poll_response: { response: "red" } }
    end

    assert_response 201
  end
end
