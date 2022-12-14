class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(body: message_params[:body], user: current_user)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @room }
      else
        format.html { render @room, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
