class Task < ApplicationRecord
  validates :title, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
