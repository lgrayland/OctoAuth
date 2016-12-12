class RemoveClientNameFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :client_name
  end
end
