class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false

      t.timestamps null: false
    end

    add_index :lists, :title
  end
end
