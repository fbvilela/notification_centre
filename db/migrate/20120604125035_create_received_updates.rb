class CreateReceivedUpdates < ActiveRecord::Migration
  def change
    create_table :received_updates do |t|
      t.string :name
      t.string :agency_id
      t.string :object_id
      t.timestamp :time

      t.timestamps
    end
  end
end
