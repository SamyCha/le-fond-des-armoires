class Product < ApplicationRecord
  has_attachments :photos, maximum: 5

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

#searchbar
  def self.search(title)
    where("name ILIKE ?", "%#{title}%")
    where("content ILIKE ?", "%#{title}%")
  end

end
