class AddImage < ActiveRecord::Migration
  def change
    add_column :questions, :img_url, :string
  end
end
