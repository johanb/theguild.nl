class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.datetime :sent_at

      t.timestamps
    end
  end
end
