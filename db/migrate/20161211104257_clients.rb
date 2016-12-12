class Clients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :secret
  end
end
