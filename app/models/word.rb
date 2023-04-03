class Word < ApplicationRecord
  belongs_to :category

  class << self
    def to_csv(collection)
      CSV.generate(col_sep: ' | ') do |csv|
        csv << attribute_names
        collection.find_each do |record|
          csv << record.attributes.values
        end
      end
    end
  end
end
