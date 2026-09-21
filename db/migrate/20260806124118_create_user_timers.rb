class CreateUserTimers < ActiveRecord::Migration[8.1]
  def change
    create_table :user_timers do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :timer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
