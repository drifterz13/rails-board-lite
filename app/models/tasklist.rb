class Tasklist < ApplicationRecord
  has_many :task

  validates :title, presence: true
end
