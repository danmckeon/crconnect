class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :status
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_phone_ext
      t.string :contact_email
      t.string :investigator_name
      t.string :investigator_role
      t.timestamps
    end
  end
end
