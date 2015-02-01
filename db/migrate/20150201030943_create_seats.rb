class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.belongs_to :boardgame_option
      t.belongs_to :user
    end
  end
end
