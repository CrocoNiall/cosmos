class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.float :long
      t.float :lat

      t.timestamps null: false
    end
  end
end
