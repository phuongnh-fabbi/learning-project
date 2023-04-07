class Question < ApplicationRecord
  belongs_to :lessons
  has_many :answers, dependent: :destroy, inverse_of: :question, autosave: true

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:content].blank?}

  self.primary_key = "id"
end
