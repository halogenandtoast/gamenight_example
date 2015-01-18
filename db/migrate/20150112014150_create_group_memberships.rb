class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.belongs_to :member, index: true, null: false
      t.belongs_to :group, index: true, null: false

      t.timestamps
    end
  end
end
