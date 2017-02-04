class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.integer :amount_cents, limit: 8
      t.string :status
      t.decimal :ltv, precision: 5, scale: 2
      t.references :owner, foreign_key: true, index: true
      t.references :property, foreign_key: true, index: true

      t.timestamps
    end
  end
end
