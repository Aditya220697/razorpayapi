class CreateFundAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :fund_accounts do |t|
      t.string :entity
      t.string :account_type
      t.string :ifsc
      t.string :name
      t.string :bank_account
      t.string :account_number
      t.string :vpa_address
      t.boolean :active
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
