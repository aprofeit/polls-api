class CreatePollOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_options do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :label

      t.timestamps
    end
  end
end
