class AddDefaultValueRoleUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :role_id, :bigint, :default => "3"
  end
end
