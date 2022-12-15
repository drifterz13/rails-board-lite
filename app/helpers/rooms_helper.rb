module RoomsHelper
  def is_room_user(room, user)
    room.users.any? { |room_user| room_user.id === user.id }
  end
end
