class Booking < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :user

  validates :in_charge, presence: true, format: { with: /\A[a-zA-Z .,'"]+\z/, message: "Only allows letters, spaces, and punctuation" }
  validate :within_business_hours, :no_overlap

  private

  def within_business_hours
    times = [start_time, end_time]
    return unless times.any?(&:nil?) || times.any? { |t| t.hour < 8 } || start_time.hour >= 18 || end_time.hour > 18

    errors.add(:base, 'Booking must be within 8:00 and 18:00')
  end

  def no_overlap
    overlapping_booking = Booking.where(meeting_room_id: meeting_room_id)
                                  .where.not(id: id)
                                  .where("(start_time, end_time) OVERLAPS (?, ?)", start_time, end_time)
                                  .exists?

    return unless overlapping_booking

    errors.add(:base, 'Booking overlaps with an existing booking for this room')
  end
end
