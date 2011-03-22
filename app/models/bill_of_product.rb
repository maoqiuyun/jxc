class BillOfProduct < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :product
end
