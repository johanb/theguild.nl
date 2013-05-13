class CreateProgrammeItems < ActiveRecord::Migration
  def change
    create_table :programme_items do |t|
      t.string :title, null: false
      t.references :event, index: true
      t.integer :position, default: 0
      t.text :resources
      t.integer :author_id
      t.timestamps
    end
  end
end
