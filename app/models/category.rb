require 'csv'
class Category < ApplicationRecord
  has_many :words
  has_many :lessons

  scope :search, -> (category) {where("name LIKE ?", "%#{category}%")}
  validates :name, presence: true
end
