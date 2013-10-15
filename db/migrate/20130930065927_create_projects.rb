class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :work_for
      t.string :types
      t.string :layouts
      t.boolean :visibility

      t.timestamps
    end
  end
end
