class Question < ApplicationRecord
  belongs_to :lessons
  has_many :answers
end
