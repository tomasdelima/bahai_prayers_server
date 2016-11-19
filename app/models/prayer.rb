class Prayer < ActiveRecord::Base
  belongs_to :category
  after_save :update_category

  def update_category
    category.update_attribute(:special_category, category.prayers.any?(&:special_prayer))
  end
end
