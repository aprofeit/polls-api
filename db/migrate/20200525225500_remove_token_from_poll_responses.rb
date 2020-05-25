class RemoveTokenFromPollResponses < ActiveRecord::Migration[6.0]
  def change

    remove_column :poll_responses, :token, :string
  end
end
