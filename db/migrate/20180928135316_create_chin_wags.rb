class CreateChinWags < ActiveRecord::Migration[5.2]
  def change
    create_table :chin_wags do |t|
      t.string :message
      t.string :text

      t.timestamps
    end
  end
end
