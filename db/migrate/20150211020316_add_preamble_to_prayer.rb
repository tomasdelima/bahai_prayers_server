class AddPreambleToPrayer < ActiveRecord::Migration
  def change
    add_column :prayers, :preamble, :text
  end
end
