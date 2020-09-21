class RenameGenreColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :genre, :genre_id
  end
end
