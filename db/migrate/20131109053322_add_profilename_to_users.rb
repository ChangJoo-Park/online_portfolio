class AddProfilenameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :bio, :text
  end
end
