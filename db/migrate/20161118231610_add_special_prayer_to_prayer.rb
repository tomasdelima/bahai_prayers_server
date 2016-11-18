class AddSpecialPrayerToPrayer < ActiveRecord::Migration
  def change
    add_column :prayers, :special_prayer, :boolean
  end
end
