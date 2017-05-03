class AddPendingToTrials < ActiveRecord::Migration[5.0]
  def change
    add_column :trials, :pending, :boolean
  end
end
