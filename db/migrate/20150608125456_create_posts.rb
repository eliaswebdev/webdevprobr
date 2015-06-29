class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :title
      t.string :resume
      t.text :content
      t.datetime :published_at
      t.boolean :status, null: false, default: false

      t.timestamps null: false
    end
  end
end
