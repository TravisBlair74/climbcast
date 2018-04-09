class AddUrlToAreas < ActiveRecord::Migration[5.1]
  def change
    add_column :areas, :url, :string
  end
end
