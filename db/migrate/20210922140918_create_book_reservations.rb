class CreateBookReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :book_reservations do |t|
      t.string :reservationNumber
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
