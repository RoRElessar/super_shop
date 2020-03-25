class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :aasm_state
      t.string :order_number

      t.timestamps
    end
  end
end
