class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :pages
      t.text :description
      t.string :languange
      t.string :publisher
      t.string :bookNumber

      t.timestamps
    end
  end
end
