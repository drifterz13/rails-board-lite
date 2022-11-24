class Tasklist < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true
end
