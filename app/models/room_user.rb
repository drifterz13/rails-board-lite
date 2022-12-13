# == Schema Information
#
# Table name: room_users
#
#  id         :integer          not null, primary key
#  room_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
end
