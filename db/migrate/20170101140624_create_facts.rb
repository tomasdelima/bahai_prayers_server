class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :name
      t.date :date
      t.text :description
      t.integer :relevance, default: 1
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
