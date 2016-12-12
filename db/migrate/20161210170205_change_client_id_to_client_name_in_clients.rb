class ChangeClientIdToClientNameInClients < ActiveRecord::Migration[5.0]
  def change
    rename_column :clients, :client_id, :client_name
  end
end
