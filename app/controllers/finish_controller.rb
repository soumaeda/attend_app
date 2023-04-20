class FinishController < ApplicationController
    def new
        @finish_time = Finish.new
    end

  def create
     @finish_time = current_user.finishes.build(finish_params)
     @finish_time.end_time = Time.zone.now
     @finish_times = Finish.all
     
    if  @finish_time.save
      redirect_to  finish_index_path
    else
      render 'finish/index'
    end
  end

  def show
    @finish_time = Finish.find(params[:id])
  end
  
  def index
     @finish_times = current_user.finishes
     @user = current_user.updated_at
  end

  private

  def finish_params
    params.require(:finish).permit(:end_time)
  end
end
