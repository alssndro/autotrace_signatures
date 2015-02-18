class ChangeDrawnSignatureTypeFromJsonToString < ActiveRecord::Migration
  def change
    change_column :drawn_signatures, :signature, :string
  end
end
