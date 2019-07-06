class CreateOfficialSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :official_sheets do |t|

      t.timestamps
    end
  end
end
