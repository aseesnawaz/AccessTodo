class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :item, null: false

      t.timestamps null: false
    end
  end
end
