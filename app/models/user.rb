class User < ActiveRecord::Base
  
  include ActivityLogger
  
  has_many :storages
  has_many :sales
  
  after_create :log_activity_create
  after_update :log_activity_update
  
  default_scope where(:status => 0)
  
  ROLES = {
    1 => "经理",
    2 => "销售员"
  } 
  GENDER = {
    1 => "男",
    0 => "女"
  }
  
  def has_role? role
    (ROLES[self.roles] & ROLES.invert[role]) == ROLES.invert[role]
  end
  
  def delete
    update_attribute(:status, 1)
    add_activities(:item => self ,:content => "<em>删除了</em>用户:(#{self.user_name})")
  end
  
   private
   def log_activity_create
     add_activities(:item => self, :content => "<em>创建了</em>用户:(#{self.user_name})")
   end
   
   def log_activity_update
     add_activities(:item => self ,:content => "<em>修改了</em>用户:(#{self.user_name})的资料")
  end
end
