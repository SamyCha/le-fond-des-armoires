class Product < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attachments :photos, maximum: 4
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, numericality: { only_integer: true }
  validates :address, presence: true, length: { minimum: 3 }
  validates :marque, presence: true
  validates :etat, presence: true
  validates :taille, presence: true


#searchbar
  def self.search(title)
    where("name ILIKE ?", "%#{title}%")
    where("content ILIKE ?", "%#{title}%")
  end

end
