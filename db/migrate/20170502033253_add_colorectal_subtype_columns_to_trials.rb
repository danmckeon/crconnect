class AddColorectalSubtypeColumnsToTrials < ActiveRecord::Migration[5.0]
  def change
    add_column :trials, :type_colorectal_adeno, :string
    add_column :trials, :type_colorectal_nonadeno, :string
  end
end
