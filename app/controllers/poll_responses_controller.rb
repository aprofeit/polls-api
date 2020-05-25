class PollResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    poll = Poll.find_by!(token: params[:poll_token])
    poll_response = poll.poll_responses.new
    poll_response.poll_option = poll.poll_options.find(params[:poll_response][:option_id])

    if poll_response.save!
      render json: { message: 'ok' }, status: 201
    else
      render json: { message: poll_response.errors.full_messages }, status: 422
    end
  end

  private

  def poll_response_params
    params.require(:poll_response).permit(:option_id)
  end
end
