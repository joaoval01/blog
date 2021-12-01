class CreateReaders < ActiveRecord::Migration[6.1]
  def change
    create_table :readers do |t|
      t.string :username
      t.email :email
      t.password :password

      t.timestamps
    end
  end
end
