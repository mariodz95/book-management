class AddColumnCountToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :amount, :integer, default: 1
  end
end
