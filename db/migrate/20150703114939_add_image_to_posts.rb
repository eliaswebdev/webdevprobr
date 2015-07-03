class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string, after: :title
  end
end
