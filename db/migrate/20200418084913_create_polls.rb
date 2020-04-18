class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :token
      t.string :question
      t.string :answers

      t.timestamps
    end

    add_index :polls, :token, unique: true
  end
end
