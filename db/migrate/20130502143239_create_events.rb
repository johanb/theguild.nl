class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
