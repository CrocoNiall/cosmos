class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :photo_id
      t.boolean :vote

      t.timestamps null: false
    end
  end
end
