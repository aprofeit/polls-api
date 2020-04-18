class Poll < ApplicationRecord
  has_many :poll_responses

  before_create :set_token

  def answer_list
    answers.split(',').map(&:strip)
  end

  private

  def set_token
    self.token = SecureRandom.hex
  end
end