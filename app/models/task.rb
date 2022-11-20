class Task < ApplicationRecord
  belongs_to :tasklist
  validates :title, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
