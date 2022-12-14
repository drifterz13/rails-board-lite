module MessagesHelper
  def message_class_by(message)
    if message.user.id === current_user.id
      "chat chat-end"
    else
      "chat chat-start"
    end
  end
end
