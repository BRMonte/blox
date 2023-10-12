# spec/models/booking.rb
require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:meeting_room) { FactoryBot.create(:meeting_room, name: 'test', user_id: user.id) }
  let(:booking) {
    FactoryBot.create(
      :booking,
      meeting_room_id: meeting_room.id,
      in_charge:       'test name',
      user_id:         user.id,
      start_time:      DateTime.current,
      end_time:        DateTime.current.advance(hours: 1)
    )
  }
  let(:no_end_time_booking) {
    FactoryBot.create(
      :booking,
      meeting_room_id: meeting_room.id,
      in_charge:       'test name',
      user_id:         user.id,
    )
  }
  let(:no_start_time_booking) {
    FactoryBot.create(
      :booking,
      meeting_room_id: meeting_room.id,
      in_charge:       'test name',
      user_id:         user.id,
    )
  }
  let(:overlap_time_booking) {
    FactoryBot.create(
      :booking,
      meeting_room_id: meeting_room.id,
      in_charge:       'test name',
      user_id:         user.id,
      start_time:      booking.start_time,
      end_time:        booking.end_time
    )
  }

  it "is valid with valid attributes" do
    expect(booking).to be_valid
  end

  it "is not valid without an in_charge person" do
    booking.in_charge = nil
    expect(booking).to_not be_valid
  end

  it "is not valid without a meeting_room" do
    booking.meeting_room = nil
    expect(booking).to_not be_valid
  end

  it "is not valid without a user" do
    booking.user = nil
    expect(booking).to_not be_valid
  end

  it "is not valid without a start_time" do
    expect { no_start_time_booking }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is not valid without an end_time" do
    expect { no_end_time_booking }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is not valid if start_time is outside business hours" do
    booking.start_time = Time.now.beginning_of_day - 1.hour
    expect(booking).to_not be_valid
  end

  it "is not valid if end_time is outside business hours" do
    booking.end_time = Time.now.beginning_of_day + 20.hours
    expect(booking).to_not be_valid
  end

  it "is not valid if it overlaps with an existing booking" do
    expect { overlap_time_booking }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
