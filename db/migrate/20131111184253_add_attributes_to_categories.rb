class AddAttributesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name, :string
    add_column :categories, :description, :text
    # category id is automatically added by rails, so no need to add it
  end
end
