class CreateJauthAuthTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :jauth_auth_tokens do |t|
      t.string :token
      t.string :refresh_token
      t.references :jauth_user, foreign_key: true

      t.timestamps
    end

    add_index :jauth_auth_tokens, :token, unique: true
    add_index :jauth_auth_tokens, :refresh_token, unique: true
  end
end
