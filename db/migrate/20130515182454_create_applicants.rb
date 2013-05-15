class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :email, null: false
      t.references :event, index: true, null: false
      t.timestamps
    end
  end
end
