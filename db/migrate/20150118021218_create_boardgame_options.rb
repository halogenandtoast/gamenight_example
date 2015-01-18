class CreateBoardgameOptions < ActiveRecord::Migration
  def change
    create_table :boardgame_options do |t|
      t.belongs_to :event, index: true
      t.belongs_to :boardgame, index: true

      t.timestamps
    end
  end
end
