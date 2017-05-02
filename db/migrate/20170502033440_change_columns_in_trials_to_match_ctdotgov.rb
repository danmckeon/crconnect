class ChangeColumnsInTrialsToMatchCtdotgov < ActiveRecord::Migration[5.0]
  def change
    rename_column :trials, :sponsor_name, :lead_sponsor_name
    rename_column :trials, :sponsor_type, :lead_sponsor_class
    rename_column :trials, :study_title, :brief_title
    rename_column :trials, :age_min, :minimum_age
    rename_column :trials, :age_max, :maximum_age
  end
end
