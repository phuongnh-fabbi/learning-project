class Lesson < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
end
