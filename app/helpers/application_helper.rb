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
end
