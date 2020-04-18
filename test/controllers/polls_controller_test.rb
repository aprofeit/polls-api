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
  end
end
