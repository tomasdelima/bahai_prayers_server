class AddActiveToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :active, :bool, default: true
  end
end
