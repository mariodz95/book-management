class AddBookToBookCateogries < ActiveRecord::Migration[6.1]
  def change
    add_reference :book_categories, :book, foreign_key: true
  end
end
