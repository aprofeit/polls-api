class ChangePollAnswersToOptions < ActiveRecord::Migration[6.0]
  def change
    rename_column :polls, :answers, :options
  end
end
