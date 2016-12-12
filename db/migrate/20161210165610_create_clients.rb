class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :client_id
      t.string :secret
      t.string :name
      t.integer :app_type
      t.boolean :active
      t.integer :refresh_token_life_time
      t.string :allowed_origin

      t.timestamps
    end
  end
end
