class Poll < ApplicationRecord
  has_many :poll_responses, dependent: :destroy
  has_many :poll_options, dependent: :destroy

  before_create :set_token
  after_commit :create_poll_options, on: :create

  def option_list
    options.split(',').map(&:strip)
  end

  private

  def create_poll_options
    option_list.each do |option|
      poll_options.create!(label: option)
    end
  end

  def set_token
    self.token = SecureRandom.hex
  end
end
