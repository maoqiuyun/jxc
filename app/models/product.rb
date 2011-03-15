class Product < ActiveRecord::Base
  include ActivityLogger
  
  belongs_to :supplier
  
  after_create :log_activity_create
  after_update :log_activity_update
  
  default_scope where(:status => 0)
  
  scope :by_name,lambda{ |name| where("products.name like ?", "%#{name}%") unless name.blank? }
  scope :by_supplier,lambda{ |supplier_name| joins("join suppliers on products.supplier_id = suppliers.id").where("suppliers.firm_name like ? ", "%#{supplier_name}%") unless supplier_name.blank?}
  scope :by_brand,lambda{|brand| where("products.brand like ?", "%#{brand}%") unless brand.blank? }
  scope :by_brand_type,lambda{|brand_type| where("products.brand_type like ?", "%#{brand_type}%") unless brand_type.blank? }
  
  
  def delete
    update_attribute(:status, 1)
    add_activities(:item => self ,:content => "<em>下架了</em>商品:(#{self.name},品牌:#{self.brand},型号:#{self.brand_type})")
  end
  
  private
  def log_activity_create
    add_activities(:item => self, :content => "<em>创建了</em>商品:(#{self.name},品牌:#{self.brand},型号:#{self.brand_type})")
  end
  
  def log_activity_update
    add_activities(:item => self ,:content => "<em>修改了</em>商品:(#{self.name},品牌:#{self.brand},型号:#{self.brand_type})的资料")
  end
end
