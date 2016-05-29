class CreateBottleshots < ActiveRecord::Migration
  def change
    create_table :bottleshots do |t|
      t.string :varietal
      t.integer :vintage
      t.integer :user_id
      t.integer :winecolor_id
      t.integer :bottleshape_id
      t.string :label_file
    end
  end
end
