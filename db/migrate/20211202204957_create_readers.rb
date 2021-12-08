class CreateReaders < ActiveRecord::Migration[6.1]
  def change
    create_table :readers do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
