require 'test_helper'

class PollResponsesControllerTest < ActionDispatch::IntegrationTest
  test "creating a response" do
    poll = polls(:colors)
    poll_option = poll_options(:red)

    assert_difference "PollResponse.count" do
      post "/polls/#{poll.token}/poll_responses", params: { poll_response: { option_id: poll_option.id } }
    end

    poll_response = PollResponse.last

    assert_equal poll, poll_response.poll
    assert_equal poll_option, poll_response.poll_option

    assert_response 201
  end

  test "getting responses" do
    poll = polls(:colors)

    get "/polls/#{poll.token}/poll_responses"

    assert_response 200
    assert_equal poll.question, parsed_response['question']
    assert_equal PollResponse.count, parsed_response['poll_responses'].size
    assert_equal PollOption.count, parsed_response['poll_options'].size
  end

  private

  def parsed_response
    JSON.parse(@response.body)
  end
end
