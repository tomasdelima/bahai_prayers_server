class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.string :author
      t.text :body
      t.references :category, index: true

      t.timestamps
    end
  end
end
