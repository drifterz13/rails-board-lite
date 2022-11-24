class Task < ApplicationRecord
  belongs_to :tasklist
  acts_as_list scope: :tasklist
  validates :title, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
