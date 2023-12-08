class CreateSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :sightings do |t|

      t.string :location
      t.string :ranger_name
      
      t.timestamps
    end
  end
end
