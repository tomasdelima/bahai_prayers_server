class AddActiveToPrayer < ActiveRecord::Migration
  def change
    add_column :prayers, :active, :bool, default: true
  end
end
