class CreateRefreshTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :refresh_tokens do |t|
      t.string :token_id
      t.integer :user_id
      t.integer :client_id
      t.timestamp :expires

      t.timestamps
    end
  end
end
