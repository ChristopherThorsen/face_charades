class ChangePhotoUrlToText < ActiveRecord::Migration
  def up
    change_column :photos, :url, :text, null: false
  end

  def down
    change_column :photos, :url, :string, null: false
  end
end
