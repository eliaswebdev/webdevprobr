class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.text :content
      t.string :ip, null: false, default: "0.0.0.0"
      t.boolean :status, null: false, default: false

      t.timestamps null: false
    end
  end
end
