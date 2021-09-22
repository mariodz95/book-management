class AddUserIdToBookReservationAndBookIdToBookReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :book_reservations, :user_id, :integer
    add_column :book_reservations, :book_id, :integer
  end
end
