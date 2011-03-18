class Log < ActiveRecord::Base
  
  belongs_to :item, :polymorphic => true
  belongs_to :user, :class_name => "User"
  
  before_save :save_user_id
  
  # scope :start_date, lambda { |start_date| where("created_at >= ?", start_date) unless start_date.blank? } 
  # scope :end_date, lambda { |end_date| where("created_at <= ?", end_date) unless end_date.blank? } 
  
  private 
  def save_user_id
    self.user_id = Thread.current[:current_user].id if Thread.current[:current_user]
  end
end
