# == Schema Information
#
# Table name: tasklists
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tasklist < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true
end
