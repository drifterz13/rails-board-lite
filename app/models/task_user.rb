# == Schema Information
#
# Table name: task_users
#
#  id         :integer          not null, primary key
#  task_id    :integer          not null
#  user_id    :integer          not null
#  role       :integer          default("followers")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TaskUser < ApplicationRecord
  enum :role, [:followers, :assignees]

  belongs_to :task
  belongs_to :user
end
