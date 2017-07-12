class AddImageRemoteUrlToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :image_remote_url, :string
  end
end
