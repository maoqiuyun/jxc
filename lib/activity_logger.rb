module ActivityLogger

  #创建日志
  def add_activities(options = {})
    Log.create!(:item => options[:item],:content => options[:content])
  end
  
end