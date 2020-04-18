class CreatePollResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_responses do |t|
      t.string :answer
      t.belongs_to :poll, null: false, foreign_key: true
      t.string :token

      t.timestamps
    end

    add_index :poll_responses, :token, unique: true
  end
end
