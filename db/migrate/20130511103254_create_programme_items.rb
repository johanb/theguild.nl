class CreateProgrammeItems < ActiveRecord::Migration
  def change
    create_table :programme_items do |t|
      t.string :title, null: false
      t.references :event, index: true
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
