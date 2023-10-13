# clock.rb
require 'clockwork'
require_relative 'config/boot'
require_relative 'config/environment'

module Clockwork
  every(1.day, 'UpdateCompletedBookingsJob', at: '00:00') { UpdateCompletedBookingsJob.perform_later }
end
