class AddTrialIdToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :trial_id, :integer
  end
end
