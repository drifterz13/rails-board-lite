# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :avatar_xl, resize_to_limit: [96, 96]
    attachable.variant :avatar_md, resize_to_limit: [40, 40]
    attachable.variant :avatar_sm, resize_to_limit: [24, 24]
  end
  has_many :task_users, dependent: :destroy
  has_many :tasks, through: :task_users
  has_many :messages, dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
