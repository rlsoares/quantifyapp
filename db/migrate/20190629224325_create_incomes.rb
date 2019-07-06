class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.string :name
      t.float :value
      t.datetime :date

      t.timestamps
    end
  end
end
