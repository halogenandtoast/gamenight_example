class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date, null: false
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
