class AddColumnPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer, after: :id
  end
end
