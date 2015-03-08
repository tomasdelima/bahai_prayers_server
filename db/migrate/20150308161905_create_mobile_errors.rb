class CreateMobileErrors < ActiveRecord::Migration
  def change
    create_table :mobile_errors do |t|
      t.text :message
      t.string :origin

      t.timestamps
    end
  end
end
