class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.float :latitude
      t.float :longitude
      t.date :date
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
