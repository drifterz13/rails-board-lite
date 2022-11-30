# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  completed   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tasklist_id :integer          not null
#  position    :integer
#
class Task < ApplicationRecord
  belongs_to :tasklist
  has_many :task_users
  has_many :task_users, through: :users

  acts_as_list scope: :tasklist
  validates :title, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
