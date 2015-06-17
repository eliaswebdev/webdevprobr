class AddColumnIpToComments < ActiveRecord::Migration
  def change
    add_column :comments, :ip_nelso, :string, after: :content
  end
end
