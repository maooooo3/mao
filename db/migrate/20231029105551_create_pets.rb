class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :genre
      t.string :kind
      t.integer :age
      t.text :detail

      t.timestamps
    end
  end
end
