class ChangeObjectIdColumn < ActiveRecord::Migration
  def change
    rename_column :received_updates, :object_id , :obj_id
  end
end
