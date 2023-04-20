class CurrentTimeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "current_time"
    update_time
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  private

  def update_time
    loop do
      ActionCable.server.broadcast "current_time", { time: Time.now.strftime("%Y年%m月%d日 %H:%M:%S") }
      sleep 1
    end
  end
  
end
