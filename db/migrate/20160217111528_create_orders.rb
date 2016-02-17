class CreateOrders < ActiveRecord::Migration
  def change
      create_table :orders do |t|
          t.string :name
          t.text :address
          t.string :tel
          t.text :list_order
          t.decimal :sum
          t.timestamps
      end
  end
end
