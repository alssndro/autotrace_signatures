class CreateDrawnSignatures < ActiveRecord::Migration
  def change
    create_table :drawn_signatures do |t|

      t.timestamps null: false
    end
  end
end
