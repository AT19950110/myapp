class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :title
      t.date :start
      t.date :fin
      t.string :allday
      t.string :memo

      t.timestamps
    end
  end
end
