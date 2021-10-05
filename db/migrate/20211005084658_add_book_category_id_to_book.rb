class AddBookCategoryIdToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :book_category_id, :integer
  end
end
