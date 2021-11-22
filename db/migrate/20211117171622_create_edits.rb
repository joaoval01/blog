class CreateEdits < ActiveRecord::Migration[6.1]
  def change
    create_table :edits do |t|
      t.string :username, null: false

      t.timestamps
    end
  end
end
