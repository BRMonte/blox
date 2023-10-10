class AddUserRefToMeetingRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :meeting_rooms, :user, foreign_key: true
  end
end
