require "rails_helper"

RSpec.describe Room do
  it "create room with messages" do
    room = create(:room)
    create(:message, room: room)
    expect(room.messages.length).to be(1)
  end
end
