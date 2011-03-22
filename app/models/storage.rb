class Storage < ActiveRecord::Base
  
  belongs_to :user
  has_many :bill_of_products, :as => :item ,:dependent => :delete_all  
  
  
  accepts_nested_attributes_for :bill_of_products ,:allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
