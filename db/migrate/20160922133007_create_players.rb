class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.text :rank
      t.integer :age

      t.timestamps
    end
  end
end
