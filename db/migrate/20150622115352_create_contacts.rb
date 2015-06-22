class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :phone
      t.string :mobile
      t.text :message
      t.integer :status

      t.timestamps null: false
    end
  end
end
