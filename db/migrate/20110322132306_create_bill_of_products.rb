class CreateBillOfProducts < ActiveRecord::Migration
  def self.up
    create_table :bill_of_products do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_of_products
  end
end
