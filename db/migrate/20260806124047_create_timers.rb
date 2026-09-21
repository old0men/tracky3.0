class CreateTimers < ActiveRecord::Migration[8.1]
  def change
    create_table :timers do |t|
      t.datetime :start
      t.datetime :end
      t.float :duration

      t.timestamps
    end
  end
end
