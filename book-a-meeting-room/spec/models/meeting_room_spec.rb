require 'rails_helper'

RSpec.describe MeetingRoom, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:meeting_room) { FactoryBot.create(:meeting_room, name: 'test', user_id: user.id) }

  it 'is valid with valid attributes' do
    expect(meeting_room).to be_valid
  end

  it 'is not valid without a name' do
    meeting_room.name = nil
    expect(meeting_room).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    duplicate_meeting_room = FactoryBot.build(:meeting_room, name: meeting_room.name)
    expect(duplicate_meeting_room).to_not be_valid
  end

  it 'is associated with bookings' do
    expect(meeting_room).to respond_to(:bookings)
  end

  it 'is associated with a user' do
    expect(meeting_room).to respond_to(:user)
  end
end
