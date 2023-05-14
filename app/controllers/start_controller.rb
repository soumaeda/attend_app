class StartController < ApplicationController
  def new
    @start_time = Start.new
  end

  def create
     @start_time = current_user.starts.build(start_params)
     @start_time.start_time = Time.zone.now
     @start_times = Start.all
     
    if  @start_time.save
      redirect_to  finish_index_path
    else
      render 'start/index'
    end
  end

  def show
    @start_time = Start.find(params[:id])
  end
  
  def index
     @start_times = current_user.starts
     @user = current_user.updated_at
  end

  private

  def start_params
    params.require(:start).permit(:start_time)
  end
end
