class PollsController < ApplicationController
  def create
    poll = Poll.new(poll_params)

    if poll.save
      render json: { token: poll.token }, status: 201
    else
      render json: { errors: poll.errors.full_messages }, status: 422
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:question, :answers)
  end
end
