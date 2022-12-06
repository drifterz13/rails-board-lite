module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def flash_color_by(type)
    case type
    when "notice"
      "notice text-green-600"
    when "alert"
      "alert text-red-600"
    end
  end

  def avatar_img(variant)
    if current_user.avatar.attached?
      current_user.avatar.variant(variant)
    else
      "user.png"
    end
  end
end
