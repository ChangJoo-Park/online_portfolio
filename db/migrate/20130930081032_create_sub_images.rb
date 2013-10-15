class CreateSubImages < ActiveRecord::Migration
  def change
    create_table :sub_images do |t|
      t.string :caption
      t.boolean :selected
      t.integer :order
      t.references :project, index: true

      t.timestamps
    end
  end
end
