class AddEmailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string, unique: true
  end
end
