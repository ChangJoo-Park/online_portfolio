class AddLayoutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :layouts, :string
  end
end
