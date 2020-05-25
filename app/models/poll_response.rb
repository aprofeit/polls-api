class PollResponse < ApplicationRecord
  belongs_to :poll
  belongs_to :poll_option
end
