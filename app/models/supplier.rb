class Supplier < ActiveRecord::Base
  
  include ActivityLogger
  
  has_many :products
  
  after_create :log_activity_create
  after_update :log_activity_update
  
  default_scope where(:status => 0)
  
  
  def delete
    update_attribute(:status, 1)
    add_activities(:item => self ,:content => "<em>删除了</em>供应商:(#{self.firm_name})")
  end
  
   private
   def log_activity_create
     add_activities(:item => self, :content => "<em>创建了</em>供应商:(#{self.firm_name})")
   end
   
   def log_activity_update
     add_activities(:item => self ,:content => "<em>修改了</em>供应商:(#{self.firm_name})的资料")
  end
  
end
