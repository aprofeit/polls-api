class RemoveAnswerFromPollResponses < ActiveRecord::Migration[6.0]
  def change
    remove_column :poll_responses, :answer, :string
  end
end
