class CreateBottleshapes < ActiveRecord::Migration
  def change
    create_table :bottleshapes do |t|
      t.string :name
    end
  end
end
