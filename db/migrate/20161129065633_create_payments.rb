class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :total_cost

      t.timestamps null: false
    end
  end
end
