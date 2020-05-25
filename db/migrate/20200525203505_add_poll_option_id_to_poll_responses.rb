class AddPollOptionIdToPollResponses < ActiveRecord::Migration[6.0]
  def change
    add_reference :poll_responses, :poll_option, null: false, foreign_key: true
  end
end
