class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.index :title, unique: true
      t.integer :count

      t.timestamps
    end
  end
end
