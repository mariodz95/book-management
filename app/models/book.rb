class Book < ApplicationRecord
  validates :name, :author, :pages, :description, :languange, :publisher, :bookNumber, presence: true
end
