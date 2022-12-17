module MessagesHelper
  def message_class_by(message, user_id)
    if message.user.id === user_id
      "chat chat-end"
    else
      "chat chat-start"
    end
  end
end
