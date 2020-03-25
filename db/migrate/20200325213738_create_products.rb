class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :slug
      t.references :category, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.integer :quantity

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
