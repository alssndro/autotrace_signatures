class AddNameToTracedSignature < ActiveRecord::Migration
  def change
    add_column :traced_signatures, :name, :string
  end
end
