class RemoveColumnIpToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :ip_nelso
  end
end
