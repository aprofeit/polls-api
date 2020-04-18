class PollsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    poll = Poll.find_by!(token: params[:token])

    render json: {
      question: poll.question,
      answer_list: poll.answer_list,
      token: poll.token
    }
  end

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
