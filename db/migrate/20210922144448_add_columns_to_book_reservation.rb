class AddColumnsToBookReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :book_reservations, :reservationNumber, :string
    add_column :book_reservations, :start, :timestamp
    add_column :book_reservations, :end, :timestamp

  end
end
