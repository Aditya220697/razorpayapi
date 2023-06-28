class CreatePays < ActiveRecord::Migration[7.0]
  def change
    create_table :pays do |t|
      t.string :name
      t.string :contact_no
      t.string :email
      t.string :upi_id
      t.integer :amount

      t.timestamps
    end
  end
end
