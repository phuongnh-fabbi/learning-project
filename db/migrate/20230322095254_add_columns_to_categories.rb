class AddColumnsToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :total_exam, :integer
    add_column :categories, :total_word, :integer
    add_column :categories, :description, :string
    add_column :categories, :created_at, :string
  end
end
