class UpdateCompletedBookingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Booking.where('end_time < ? AND completed = ?', Time.now, false).update_all(completed: true)
  end
end
