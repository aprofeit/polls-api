class PollsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    polls = Poll.last(5).reverse

    render json: polls
  end

  def show
    poll = Poll.find_by!(token: params[:token])

    render json: poll.as_json(include: :poll_options)
  end

  def create
    poll = Poll.new(poll_params)

    if poll.save
      render json: poll, status: 201
    else
      render json: { errors: poll.errors.full_messages }, status: 422
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:question, :answers)
  end
end
