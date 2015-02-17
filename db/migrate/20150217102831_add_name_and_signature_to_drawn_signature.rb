class AddNameAndSignatureToDrawnSignature < ActiveRecord::Migration
  def change
    add_column :drawn_signatures, :name, :string
    add_column :drawn_signatures, :signature, :json
  end
end
