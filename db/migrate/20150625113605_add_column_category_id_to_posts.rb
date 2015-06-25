class AddColumnCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer, after: :id, index: true
  end
end
