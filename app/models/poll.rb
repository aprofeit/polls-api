class Poll < ApplicationRecord
  has_many :poll_responses
  has_many :poll_options

  before_create :set_token
  after_commit :create_poll_options, on: :create

  def answer_list
    answers.split(',').map(&:strip)
  end

  private

  def create_poll_options
    answer_list.each do |answer|
      poll_options.create!(label: answer)
    end
  end

  def set_token
    self.token = SecureRandom.hex
  end
end
