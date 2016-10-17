class CreateCaregories < ActiveRecord::Migration[5.0]
  def change
    create_table :caregories do |t|
      t.string :name

      t.timestamps
    end
  end
end
