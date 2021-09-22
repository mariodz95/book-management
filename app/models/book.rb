class Book < ApplicationRecord
  validates :name, :author, :pages, :description, :languange, :publisher, :bookNumber, presence: true
  

  VALID_STATUSES = ['available', 'unavailable']

  validates :status, inclusion: { in: VALID_STATUSES }

  def available?
    status == 'available'
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
