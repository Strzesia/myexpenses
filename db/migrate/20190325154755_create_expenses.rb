class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.decimal :amount, precision: 20, scale: 2
      t.date :date
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
