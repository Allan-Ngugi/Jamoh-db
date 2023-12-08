class CreateEndangeredAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :endangered_animals do |t|

      t.string :name
      t.string :health
      t.string :age, default: 0, null: false
      
      t.timestamps
    end
  end
end
