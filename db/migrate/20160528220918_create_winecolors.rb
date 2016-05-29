class CreateWinecolors < ActiveRecord::Migration
  def change
    create_table :winecolors do |t|
      t.string :name
    end
  end
end
