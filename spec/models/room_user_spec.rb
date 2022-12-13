require "rails_helper"

RSpec.describe RoomUser do
  it "create user to rooms association" do
    user = create(:user)
    room = create(:room)
    create(:message, room: room, user: user)
    create(:room_user, room: room, user: user)
    expect(user.rooms).to include(room)
  end

  it "create room to users association" do
    user = create(:user)
    room = create(:room)
    create(:message, room: room, user: user)
    create(:room_user, room: room, user: user)
    expect(room.users).to include(user)
  end
end
