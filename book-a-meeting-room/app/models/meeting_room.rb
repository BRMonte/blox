class MeetingRoom < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, uniqueness: true, presence: true
end
