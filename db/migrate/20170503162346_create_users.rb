class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :name
      t.boolean :is_admin?

      t.timestamps
    end
  end
end
