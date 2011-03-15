class LogsController < ApplicationController
  
  def index
    @start_date ,@end_date = params.values_at(:start_date,:end_date)
    @logs = Log.start_date(@start_date).end_date(@end_date).order("id desc").paginate :page => params[:page], :per_page => 20
  end

end
