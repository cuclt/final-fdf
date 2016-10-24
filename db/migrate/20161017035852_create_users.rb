class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :chatwork_id
      t.integer :role, default: 0
      t.string :avatar

      t.timestamps
    end
  end
end
