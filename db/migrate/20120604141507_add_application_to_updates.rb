class AddApplicationToUpdates < ActiveRecord::Migration
  def change
  	add_column :received_updates, :application_id, :integer
  end
end
