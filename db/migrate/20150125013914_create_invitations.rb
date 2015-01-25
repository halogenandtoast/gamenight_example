class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to :group, index: true
      t.string :code
      t.string :email
      t.belongs_to :sender, index: true

      t.timestamps
    end
  end
end
