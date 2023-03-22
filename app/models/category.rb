class Category < ApplicationRecord
  has_many :words
  has_many :lessons

  private

  def self.search(category)
    where("name LIKE ?", "%#{category}%")
  end
end
