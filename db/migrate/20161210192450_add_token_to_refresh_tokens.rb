class AddTokenToRefreshTokens < ActiveRecord::Migration[5.0]
  def change
    add_column :refresh_tokens, :token, :string
  end
end
