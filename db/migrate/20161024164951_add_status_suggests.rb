class AddStatusSuggests < ActiveRecord::Migration[5.0]
  def change
    add_column :suggests, :status, :boolean, default: true
  end
end
