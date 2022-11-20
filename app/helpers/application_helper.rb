module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def flash_color_by(type)
    puts type
    case type
    when "notice"
      "text-green-600"
    when "alert"
      "text-red-600"
    end
  end
end
