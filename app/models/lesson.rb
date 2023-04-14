class Lesson < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy, inverse_of: :lessons, autosave: true
  has_many :results

  scope :search, -> (lesson) {where("name LIKE ?", "%#{lesson}%")}

  accepts_nested_attributes_for :questions, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:content].blank?}
end
