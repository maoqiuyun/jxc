class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :storages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :storages
  end
end
