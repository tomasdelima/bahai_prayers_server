class AddSpecialCategoryToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :special_category, :boolean
  end
end
