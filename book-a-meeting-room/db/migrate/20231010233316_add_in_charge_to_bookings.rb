class AddInChargeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :in_charge, :string
  end
end
