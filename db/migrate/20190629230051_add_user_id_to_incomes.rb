class AddUserIdToIncomes < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :user_id, :integer
    add_index :incomes, :user_id
  end
end
