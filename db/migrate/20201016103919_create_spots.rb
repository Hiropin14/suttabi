class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.text :body
      t.text :about
      t.string :name
      t.string :image
      t.string :address
      t.datetime :worktime
      t.references :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
