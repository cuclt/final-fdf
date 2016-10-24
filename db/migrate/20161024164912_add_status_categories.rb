class AddStatusCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :status, :string, default: true
  end
end
