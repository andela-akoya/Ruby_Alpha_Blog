class AddImageRemoteIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :image_remote_id, :string
  end
end
