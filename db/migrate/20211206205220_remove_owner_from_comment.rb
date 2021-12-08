class RemoveOwnerFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :owner, :string
  end
end
