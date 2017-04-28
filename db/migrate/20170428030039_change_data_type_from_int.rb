class ChangeDataTypeFromInt < ActiveRecord::Migration[5.0]
  def change
    change_column(:trials, :cohort, :string)
    change_column(:trials, :age_min, :string)
    change_column(:trials, :age_max, :string)
  end
end
