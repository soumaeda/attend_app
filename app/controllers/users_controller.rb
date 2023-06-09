class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user.updated_at
  end
  
  def show
    @user = User.find(params[:id])
    @time=Time.current
    @finish_time = Finish.new
    @finish_time.timestamp = Time.zone.now
    @finish_times = Finish.all
    @start_time = Start.new
    @start_time.timestamp = Time.zone.now
    @start_times = Start.all
  end
  
  def destroy
    
  end
end
