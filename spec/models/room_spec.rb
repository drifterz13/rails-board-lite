# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Room do
  it "create room with messages" do
    room = create(:room)
    create(:message, room: room)
    expect(room.messages.length).to be(1)
  end
end
