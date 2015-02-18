class AddSourceImageToTracedSignatures < ActiveRecord::Migration
  def change
    add_column :traced_signatures, :source_image, :string
  end
end
