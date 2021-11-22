class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name,  null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end