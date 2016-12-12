class AddSecretToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :secret, :string
    add_index :clients, :secret, unique: true
  end
end
