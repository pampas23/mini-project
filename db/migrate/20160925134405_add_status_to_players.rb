class AddStatusToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :birth_day, :date_select
  end
end
