class LogsController < ApplicationController
  
  def index
    # @start_date ,@end_date = params.values_at(:start_date,:end_date)
    @search = Log.search(params[:search])
    @logs = @search.order("id desc").paginate :page => params[:page], :per_page => 20
  end

end
