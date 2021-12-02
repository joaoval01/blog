class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.bigint :user_owner
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
