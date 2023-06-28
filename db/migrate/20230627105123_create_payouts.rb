class CreatePayouts < ActiveRecord::Migration[7.0]
  def change
    create_table :payouts do |t|
      t.string :account_number
      t.integer :amount
      t.string :currency
      t.string :mode
      t.string :purpose
      t.references :fund_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
