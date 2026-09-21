class CreateRands < ActiveRecord::Migration[8.1]
  def change
    create_table :rands do |t|
      t.string :name
      t.integer :age
      t.float :height

      t.timestamps
    end
  end
end
