class CreateEdits < ActiveRecord::Migration[6.1]
  def change
    create_table :edits do |t|
      t.string :username

      t.timestamps
    end
  end
end
