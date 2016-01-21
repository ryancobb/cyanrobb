class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string
  end

  def down
    remove_column :posts, :image
  end
end