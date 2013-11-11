class AddAttributesToServices < ActiveRecord::Migration
  def change
    add_column :services, :title, :string
    add_column :services, :description, :text
    add_column :services, :visibility, :integer
  end
end
