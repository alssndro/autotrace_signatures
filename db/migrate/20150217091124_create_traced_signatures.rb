class CreateTracedSignatures < ActiveRecord::Migration
  def change
    create_table :traced_signatures do |t|

      t.timestamps null: false
    end
  end
end
